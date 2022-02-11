Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7739EC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:49:51 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.8896.1644594590660292285
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=CJ8IdYL5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id y8so9356052qtn.8
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B6k63EB36a1NiglZxBpWdB/RFJzlnwvlBPwNnTNGRWc=;
        b=CJ8IdYL50GQMFcZASk7jdcjVig3XUcX1Zibt4xkM48nnNzeH/Cc0Fm5RkxdtKF+DA3
         RhgGq4AI9iteDXaIxDNfU3wPQWmpciYYM5BGumz9AeieIvVe+NmghL6tNXag6PBz0aNx
         lJ5vEtVNQneZYQjp/6TCLlWsh/GbLv2QbYUZT1f3NaE5KBP8DJJr3BYArNHb3Cbf7QWp
         FeZRdHrWLPG4t4i2fq10Wo3WGTKfDSo6rxdCDYZS7faiTD6B8YNIFkqFMiJRN4wtYH8d
         adzFQPvuvvSkDAZrV36NaIwAHd6tnEvrcCi3BZf+hkJIPYyfaUKXxuEZersctiNlQpoD
         Wygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B6k63EB36a1NiglZxBpWdB/RFJzlnwvlBPwNnTNGRWc=;
        b=UoML3NUXaQxnPN9qr+6gP3aElfnBl9fCyagdh+zNDk3mGRHuI6/kmxcE5g6lnmaYc+
         eUNlLthp5EoksObDvdHxHC5CVA5hqEYs7qz5YhyP4y8pq0V5nnZMhvoN1NKgK2He/gvH
         Amw/VCoBs//offG2w/AoknLN4BZPnngFh0HezV0hIjYQzjG5ansW5R6rKEC8ubu5/qct
         OC2gBK+NZIW/BPTRLZGWBIG2LcSXbKGwaydspHjECw8DFWKSpMQda8XomFxBoU0nehfU
         49nDJ7ZT11CEVVtSOyxiFhDIIhdXmFb9+5wrEB9BG4b5zleWSi9VwFr3c2JBInv2E5Hs
         cnOg==
X-Gm-Message-State: AOAM5337Wa15h3qlteApZe588SwAgYhfFJHtCSVCmA1OJZxGWqu5S0IK
	SFQAe/SUS0Levz8TqqdpOPYqJc07opN5hQ==
X-Google-Smtp-Source: 
 ABdhPJyB2s6VsaQb17iBxmv8VaMeLrxeb537XEc9nEsovI/I8BY/RosmBp4+LBR1FcYT3MCwq0NkHQ==
X-Received: by 2002:a05:622a:10f:: with SMTP id
 u15mr1494298qtw.339.1644594589721;
        Fri, 11 Feb 2022 07:49:49 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:6bed:1ee8:a843:e258])
        by smtp.gmail.com with ESMTPSA id
 bl34sm9356568qkb.15.2022.02.11.07.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:49:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/5] CI: build perf via CORE_IMAGE_EXTRA_INSTALL
Date: Fri, 11 Feb 2022 10:49:18 -0500
Message-Id: <164459455940.4074336.5838235357625046424.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211105608.2483647-1-ross.burton@arm.com>
References: <20220211105608.2483647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 15:49:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2994

On Fri, 11 Feb 2022 10:56:04 +0000, Ross Burton wrote:
> Instead of adding perf to the target: list, add it to
> CORE_IMAGE_EXTRA_INSTALL. This means that machine configurations which
> need to change the target don't need to also build perf explicitly.

Applied, thanks!

[1/5] CI: build perf via CORE_IMAGE_EXTRA_INSTALL
      commit: f868b51fd3d007dbbaf6ceb8c9932c13f91a3142
[2/5] CI: improve coverage of corstone1000
      commit: 94a08c23b0a5b6b8a406e818941243f9162e2b80
[3/5] arm/trusted-firmware-m: stop FetchContent from fetching
      commit: c6b347d3e6cff0b3438d54c3ff430deb7e7bbe5c
[4/5] arm-bsp/trusted-firmware-m: add OpenAMP to the CS1K build
      commit: 77fac4cf2a3f2ad14bbda1c6472cb00f5ebd8924
[5/5] arm/secure-partitions: allow network operations during do_configure
      commit: 59db2ebad7198464be76af5615fb0c8b56482315

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

