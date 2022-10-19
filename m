Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCD8C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 18:34:40 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.363.1666204471282642951
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 11:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=PV3XR8f3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id i9so12004026qvu.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=PV3XR8f3sAkIWjrez6Z+B4SrW3DhV5/oQtZTyJl+nB6fb+YH5uK2MZdGmBOnRogSjY
         QkcdcgGIxtQGifFxdGWFkyMslgdtMTiOZPAJS2Tt509c7Z06saD7/CThlvJuktMjcc/O
         jkbFeSwYzxIiHthBRq5oRha1vZ3SiQRbkRk6s7DPWKZBjxMYbLTKqAJzatavbrP96UPT
         c3yI6vkgsRgSfKAXMwoshW52miAiyWclZTH7cggQtsclV+nPOh8Krb9shSeVSNwB6Yep
         EwXd/IsPCMtzZEhjG8me4A2YKl1bfEAHSaz6PWtFK/dIiDzLaOySUwKogE7GbtfnGhwi
         c2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oSRDQHR4temNEQStXxg52zcDz+soSrcigh7iX4CpSU=;
        b=wDJrzynd37llRS9pZ6HS4n/2Ia8wO/u4TcN5ubFFmtv/rzvO8AYSeMGRIv2Q0I0cUj
         tn2WiHkv9pUC+uTopGrkX2+jpzXjlu6H/N9U1ykmCTvVy5VzP6jNtDiMvRrmiY4fy1U1
         wlGNqRq1Gnb/GRAN50YUEurkFusVVqiV+Yz+gwSUTdWKCdRB64eoUwW8AGchko1MNhW2
         oh7GntXozx5eG7fcS+3OfREM0o5DEQBsiB7CCdSvn4UciG7ei2ipMw4Oc8el/sqVxIpA
         HtvIOGLt8HrLBd1H7wsg1mf/re0M+AOHuE02pINLCR0Il9KluTcqpntduMQdKhIWg+6W
         BtmA==
X-Gm-Message-State: ACrzQf0t0w+n/aYWwQ+KZcsr7Bp1gejl/C2AqGcszKUYSRfK6si30cC1
	/ZGBHj2wUiKKZG7/SuxlEwJMNEGoi6vpqg==
X-Google-Smtp-Source: AMsMyM6nUVRf2Wy9YDjDVGJHwOoWSGR6nAQee0cljI+OnrnqLN/Kr7EI/xbx9NgSjXaCGIJwKL1ZhQ==
X-Received: by 2002:a05:6214:1c44:b0:4b3:203b:7383 with SMTP id if4-20020a0562141c4400b004b3203b7383mr7947504qvb.69.1666204475289;
        Wed, 19 Oct 2022 11:34:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a074800b006cea2984c9bsm5185293qki.100.2022.10.19.11.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 11:34:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-bsp: remove TC0
Date: Wed, 19 Oct 2022 14:34:29 -0400
Message-Id: <166620447073.1443177.10080253275466371360.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019133952.3018499-1-ross.burton@arm.com>
References: <20221019133952.3018499-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 18:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3987

On Wed, 19 Oct 2022 14:39:50 +0100, Ross Burton wrote:
> The Total Compute 2020 BSP is obsolete and unsupported, so remove it
> from meta-arm.  The Total Compute team would like TC1 to be available in
> langdale, but removed in mickledore.

Applied, thanks!

[1/3] arm-bsp: remove TC0
      commit: 75a8c07a636314c0e5e30c01b5d595b500716adc
[2/3] arm-bsp/scp-firmware: remove TC0 patches
      commit: c9874bebc7a57cda2c419ee722184a1f5d3f81ed
[3/3] arm/fvp-tc0: remove Total Compute 2020 FVP
      commit: 75b883c363260e4873a8575607395ee4b5242e29

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

