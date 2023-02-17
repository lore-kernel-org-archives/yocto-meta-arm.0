Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5508C6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:40 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.263.1676608290903427209
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=qeV1u/xH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d10so80693qtr.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toANZGnn38tMw1FQ2DMUKW6z+LInD43hX5SSNaEnuhY=;
        b=qeV1u/xHhY511d6o+h9aojkdGn2OjJxhhB0sk2qZe/tUb4Af0bvpb9vmyhz1crHbI/
         p7evNBQ015Lo9MFiMe7g/D1nU3F4P33Ll4mIxRu+Ybu6J4+m5h2fF57rFCFCHQ2jT+Nj
         pbpawcFOVqtw3H8BjBY/5pJ9ik4w4L8u6g5/y0wmIAOkjklbWey+y8ClQ7G+BKNgsypq
         HzfXX1qHmTWY/dNYtSJqx5RmeMiDiLK+xmUMpjEvr/62ReXH0TseEx0N3Q1ks+/J4CWD
         iXxwhm6367rRyx4lKKulqmT3tojwqsUb5UX/2hhlKF8juz16L7cQEVpiLZ+LeUf6M+Oh
         eoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toANZGnn38tMw1FQ2DMUKW6z+LInD43hX5SSNaEnuhY=;
        b=b1JyQPzKQ0BIHGWmSkL1kCMwrn8WHMfRp0VF+LM2zen133ejEBxj/V4NV+BUHvyFNx
         MG/UC4NQCnuKxnQD83oNc37kxGUGENlYgeciTU8RZak3sx1VxuEObwhhq0K7qrPgwKzX
         Fw6J3Ndp+iYqI/8c9viDoyYdEe9jv+53QKiuVkdWbkOYt4PGK3xbomsXPv7pvTzBUHvf
         wddIXsGntv9ivFvOurjjjX7/MUHUAuQZ0Ah2kYUIV9iGSELXnbKQO4fRehb4VlM7cCav
         nKW3Im0UhKAA8eYQBHU8AP97isVQu3y5tyVzOC5/CA8z2VEktZlOKFaH8ryjUpNU6da+
         4cnQ==
X-Gm-Message-State: AO0yUKVEHiJDUtkR1p0Yd1itBNEur/edQ7bpxWfQfqnrWVaFmbdOJt3h
	A80FIvvX4kV20XS3iMHzc+xa9EeWUmdjfBT8
X-Google-Smtp-Source: AK7set8s5kJZS+YU8p9H2kS1pocPtmJblwGn2RePAM2H/hW2hybZB16l/7tarrQMlOQRMIV+dDyAzw==
X-Received: by 2002:a05:622a:1ce:b0:3b9:b4b5:4b7a with SMTP id t14-20020a05622a01ce00b003b9b4b54b7amr39919qtw.11.1676608289549;
        Thu, 16 Feb 2023 20:31:29 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id w10-20020ac86b0a000000b003b8484fdfccsm2537014qts.42.2023.02.16.20.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/trusted-firmware-m: Do not use release branches
Date: Thu, 16 Feb 2023 23:30:59 -0500
Message-Id: <167660825902.685488.6315850596828284170.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208202918.2662658-1-ross.burton@arm.com>
References: <20230208202918.2662658-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4422

On Wed, 8 Feb 2023 20:29:17 +0000, Ross Burton wrote:
> TF-M does not use persistent release branches and the release-* branches
> have been removed from the repository, so switch the branches to master.
> 
> Also update the tf-m-tests SRVREV to the 1.7.0 tag, not the RC2.
> 
> 99% based on a patch by Peter Hoyes <Peter.Hoyes@arm.com>.

Applied, thanks!

[1/1] arm/trusted-firmware-m: Do not use release branches
      commit: 79b44a4d32bc19eda2b3dec5750a818959097cd6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

