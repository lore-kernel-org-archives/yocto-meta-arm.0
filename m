Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B98EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 04:08:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3739.1687320530099370070
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 21:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=z+q2Nwul;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-763d1448ba7so4171185a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 21:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1687320529; x=1689912529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ky9KtV5JYRXeZznkkNTSGxFvyp9kmJPq9RSIFs2yIdg=;
        b=z+q2Nwul2ujZ1SY9U11Ne1UGQV+nlPatPR6JBHRQuKBhtfm0f9R+NxRIBfV49zGJ7C
         d8OW+mU5tQ0zLh9Hd3taqazKgayVE7v+Rz6XLCJeXgloKMBf4QpHRnQm4TNp5KmC247I
         4BbiV3r3HH+njAJy9uTEwxGp+gDVi3WyweWlRJ0LEvH8of69iYoqR88HVOEEQwANrgxn
         T1xWgRwxxqPCFkRZ0Pninm1X5YfxlOUfBJmuzartwhL6rRk9EcipODvXr7IBWl9Rrlul
         vCiqy3xvVq5FukzcjTcDpGQdW97B4hsfY04RFYLVNo8A3bfavNsMEk23kLbDiUJzQQl9
         ehTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687320529; x=1689912529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ky9KtV5JYRXeZznkkNTSGxFvyp9kmJPq9RSIFs2yIdg=;
        b=d3jQaxCmlsElvXftWFZkOlBCRsPX90EB7wQrAJ2KFZWnsmyJHgwpQ47muXYMY1Vabi
         Xqok34y2J83RUNA5TXhVSVcDPh2MEKfqza490qfHX43lpljmm0EMnHBg5LIiF51ps2G/
         iqHguoxHoBN35GT1sMIIxYhNhGhgk0xYesAyR+uO3wPl+noyDGRFt0OUbBxQjeayebcY
         UDV2gi+FTf5fZQEwl1NVjvhWkX0c8FHsyFyVtXm1aqqex5HoaEzMI7999+Ex9xTwTyfJ
         lvct1Mh/szaIeIVuZvU5GPIXhh3Z5HXe5T951K6zfH/W6JMY5dp7gax22YhEhF8R87Fk
         itkQ==
X-Gm-Message-State: AC+VfDzyI5uaDb+9+kGUxwtHiIqRjz5YP9zRF7mCXImzR/jfpPry90iP
	hlA8ZWc+FhKbok/moxaepOjeAySpty3uz/GalVM=
X-Google-Smtp-Source: ACHHUZ59+AyjIOMfpVQ8uOWuGAKZDBjzObLhOHXypcSdtjfiAsG4uvzX7HcLKkLpiHbIOEyyeQrzJA==
X-Received: by 2002:a05:620a:370c:b0:763:c950:c085 with SMTP id de12-20020a05620a370c00b00763c950c085mr458101qkb.58.1687320528802;
        Tue, 20 Jun 2023 21:08:48 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x5-20020a05620a14a500b00761f635fbf6sm1847936qkj.8.2023.06.20.21.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 21:08:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/gn: fix build with GCC <13
Date: Wed, 21 Jun 2023 00:08:24 -0400
Message-Id: <168732050505.869555.14453504987089306146.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230620140137.481227-1-ross.burton@arm.com>
References: <20230620140137.481227-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jun 2023 04:08:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4811

On Tue, 20 Jun 2023 15:01:37 +0100, ross.burton@arm.com wrote:
> The previous commit fixed the build of GN with GCC 13, but broke it for
> any other version.
> 
> Remove the patch and simply disable the fatal warning that causes the
> breakage. Interestingly, this warning is already disabled for Windows
> builds.

Applied, thanks!

[1/1] arm/gn: fix build with GCC <13
      commit: 533cbfd10b56cf4ed53c8fefc60095434544d450

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

