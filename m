Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C969CC54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 18:27:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.1082.1673375242603377832
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 10:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=G7nOfdUC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id c7so11592481qtw.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7Jv61epNUoBHkNYChgCLkAnLqhWcW7gJJI4QJHF8n8=;
        b=G7nOfdUC+APsC9a/RBakOyLIYBISaHhykmm4Luga3I7m0p/YhxsLPOWNjCCjXM1Krv
         5Cc8SZLpq7WkTP8Azrv4qZYuwTMUUFjdjwWjP9rh1DGhP1TSnOpchZYOJt8XqmUXwoZT
         gmfGaZmBFTXDdKYbULsKTsrhNmf4/1YoBXTnp1ThmRLMklE+JEo+L92Wb+JzDhrWaN1Z
         OncM/0MtulbRfW+yllz4gbYqQOSJn8r+tdGBUVVq1KeyxthatFLW6rqJfjNByWpzTM5D
         oYftGGvxe/IsrGwQn11XUGfjPpNbICZc03qjG2hJBQqriAPJZUCmBV0zeycJLDf0lGym
         4j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7Jv61epNUoBHkNYChgCLkAnLqhWcW7gJJI4QJHF8n8=;
        b=rgoR/SbEhMKZY3XYXKkmh10J28j/LFZxfQRs8zVehOjULEcczrUbIKxJEuGFrxxBdw
         mDzTbFRAOMwRy58gx+PkSsXkcohTBW8Z7E7E1L56QVDSW53u/q5EszKUQqUdaoK+IJBq
         CtyaqAQdqh7TGSb1UoSV106sTsOxnX0UvxWFeww/Mukb1osw3a4CAaIpvPAl3r/RGfB0
         WftEtlkzJ6ZmUM/6tpkXnhoOSiX/8JWgsz5fYLlYmsH6vDtRiyLyf5HMGx0ChDC6kMb8
         OgqbrWO3XIn1REdVPW5P1RzBDLZWJmzT+ApnBnuS/Gg6XvHqfMW5s9sT68L/+6izsd9/
         cx8w==
X-Gm-Message-State: AFqh2kpxrYCY+I5XvN/rCrO7zt/a5lagUQGe313BzZ4YK5sI5JjD5yLa
	aBBcHP3yOMAqEElPEm+vDIx/bOESueBvUpJj
X-Google-Smtp-Source: AMrXdXsBZxUvXPtBdoBXizlRY41cnlxeqHoKBLbpMfYS98JM2yGt+JiGWH9ME4rAMxsxQrq5Kp77SQ==
X-Received: by 2002:ac8:444b:0:b0:3a5:c024:7ed4 with SMTP id m11-20020ac8444b000000b003a5c0247ed4mr5167238qtn.17.1673375241265;
        Tue, 10 Jan 2023 10:27:21 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id c15-20020ae9ed0f000000b006fafc111b12sm7508391qkg.83.2023.01.10.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:27:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Diego.Sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH][langdale] arm/classes: Ensure patch files are sorted in apply_local_src_patches
Date: Tue, 10 Jan 2023 13:27:11 -0500
Message-Id: <167337523151.2415233.14422420843894573762.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110133859.2230025-1-peter.hoyes@arm.com>
References: <20230110133859.2230025-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 18:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4254

On Tue, 10 Jan 2023 13:38:59 +0000, Peter Hoyes wrote:
> apply_local_src_patches.bbclass was added in a previous patch to handle
> the application of patch files located inside the fetched source code.
> 
> find is used to collect the patch files which does not guarantee the
> order of its output. Pipe the output of find into sort to ensure patch
> files are applied in the correct order.

Applied, thanks!

[1/1] arm/classes: Ensure patch files are sorted in apply_local_src_patches
      commit: 8b95c97a00c9b6dea4221726c0ef58c6c4a3175f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

