Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE583C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 13:19:47 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.10532.1664889581663257493
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yCWLZM/T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id mx8so2286010qvb.8
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=vo2qL0lIvf8VPDs+iW2QdW3hzlUTxTXUGayJSM5oOrs=;
        b=yCWLZM/Tzpsqo2zeZjjuDtvZcuT7J/CPJypfM0wIYwlhahvSXA12lRVDf903gpjD76
         912TavWk5zcyXCgY+tmpO+tyHFXUvaCtz9g9vp1pFsxx2861B8DBWwTNtfsOBM5KSSTo
         3WX3mrQXz2aoSBQlSf+BHsN4hjky5NI9HesnkhvpeiyHDgnDpCtynz2HE+xzg41utl1K
         YOvqtOQ7JDD02mfaWTvUmRCB4wU0nIzcvJggQxyyflZOSbXilKstbloUOFhpbazy6vq3
         pz14d0Zl80tlL/2oNJ9nypiRbNGVGuO2ItZ4pBize+VQI2ozx6+iT6DCo4iiQmeu/GnT
         xmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vo2qL0lIvf8VPDs+iW2QdW3hzlUTxTXUGayJSM5oOrs=;
        b=BCK///SBZBVGm+qqG1L0HoK2LH9aYlQeON99+c398602sZuH38c+g6+l22Wv+lYQii
         QZUhh98YGKPK/BdN6+Eq3gDEZCD/Mw57xqAarWc27V9/J+3i3WYrWL/NsF6Z3wHoociz
         MUO53Rsh9JkgXIOKSBrgTZDrf8GORJPFs2WWizHNcrvFMzStDb6H9MZuWE2Zb/brdtNc
         c8msQ537bGSCimUPQIQcYHPCRwraxgaw5PPqZ9ZQWkUkcjVJHuDOtrUV2TcjPOci3RfK
         b9L5OZgDX++RXL8u9wfP2biNTJEQ5OmDbErF5f3VmnFGEETPJJn16rhd/fYarsonXTVE
         q5lQ==
X-Gm-Message-State: ACrzQf3486Q+RERfoBRdBUddwPrZNxRs5o3+JfgmxujbfZG/lH0sPZlY
	YjZh3pGDrlncyyJEUx8qM+8sOP/mBAL4Y6SH
X-Google-Smtp-Source: 
 AMsMyM4xqQ8s1XfMjd4fAgp2qj1gwoirDkUv/Z2issXrZhHydvuL7EmsHf7kYsRneeCso+mwWv/3rQ==
X-Received: by 2002:a05:6214:2029:b0:4ac:b9f0:4d04 with SMTP id
 9-20020a056214202900b004acb9f04d04mr19553000qvf.93.1664889580303;
        Tue, 04 Oct 2022 06:19:40 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 l18-20020a37f912000000b006ce580c2663sm14271675qkj.35.2022.10.04.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:19:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone1000: bump kernel version to 5.19
Date: Tue,  4 Oct 2022 09:19:29 -0400
Message-Id: <166488956989.128453.10485775518159619445.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004113939.1290283-1-rui.silva@linaro.org>
References: <20221004113939.1290283-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 13:19:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3918

On Tue, 4 Oct 2022 12:39:39 +0100, Rui Miguel Silva wrote:
> Bump the kernel version to 5.19.9, remove backported ffa
> related patch to previous version and fix issues in the arm
> rpmsg driver.

Applied, thanks!

[1/1] arm-bsp/corstone1000: bump kernel version to 5.19
      commit: 38a3facd90cd8e3f7c90817e9b53b608735b1f82

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

