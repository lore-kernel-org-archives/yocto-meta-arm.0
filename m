Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B60C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:59:28 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.5982.1654693164492776610
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GgYYKCBp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id hh4so14780783qtb.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PQQMqhnYsOGZGO4iAmVVZ6fRbP2/+d+vhMt1j33m7Mw=;
        b=GgYYKCBppWxCDXL7XTId6YrNKkd2VKN6o8oRkkW0449yqEhUsXaduaveBu6EYTzsES
         nTmTqcx1NGICj5pb5tovOABFIP6pkwo00f5Lf8Tl8MoLF7Och7Pi6aPKmfGspVCU4wm0
         NDkNYHaDxWKTfRWEgjV/Xei0mLwN/e39lTyXfLlkYcxAGC6Z8NSDrDssIhUCIANRa/1i
         YqHzNvOGf2DCPFJVZ6abbDzZOhX3V163sJrbQOxIkXz+w72yBvlL3xEJARvyB0OQvpxU
         Bys3sObLpgjjFmVBWTngsuc+d+dU7Pdvz/6S0q1GQtzTYrRXx31Ryng0mJj3Olhv+cyW
         oQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQQMqhnYsOGZGO4iAmVVZ6fRbP2/+d+vhMt1j33m7Mw=;
        b=FddfQqYInsDiQUC427pz5zAaUgDT/nLuu5lUBcfkU8tDxkLgo+YyNuPyR9+7U16nmO
         8fLlAGB1WNTWHXvXjQ2ymTc2AxphEmiOphSn/2Mvu0NvtoaB+OMrC32hiiX69no7+eAe
         Bu38J1oBgA98GUK0L43FTa9bcvvwkDBbOA177XbTIt8/7C5BCA+L6XpyWP5RsFAOjJ2R
         F+Z2Y3z7/Cbrhg4VPdKcSMAg2Y+jYjIAUif/b3bgl42bH1255qU0NuTRYfdypUSAqeNe
         B06f8tddNS3US+H5hPuXR/Xo70v4VmPw+nbweTndcDVSDQ6Lebiemcj8JUaZV4JGyIJV
         Jqyw==
X-Gm-Message-State: AOAM530Yc2sIu7vJIdji2EGV1BB3KnPXqW1yyBX0qr5BHFHFZhSGD/vP
	ym3rN19gmB/ep1UZqlEROT58yKMToExjkw==
X-Google-Smtp-Source: 
 ABdhPJwBmx+6x8HQB2wnlfcQZggC0uFBFs5MsZLkakKxeS1bZp0b25Hh/8HmN0w6oZGFmsZv+PJixA==
X-Received: by 2002:a05:622a:489:b0:304:c53b:afcf with SMTP id
 p9-20020a05622a048900b00304c53bafcfmr26794467qtx.351.1654693163301;
        Wed, 08 Jun 2022 05:59:23 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a05620a400b00b006a684c87f4bsm14319187qko.68.2022.06.08.05.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:59:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com,
	robbie.cao@arm.com
Subject: Re: [PATCH 1/2][kirkstone] arm-bsp/u-boot: fvp-baser-aemv8r64
 cache_state_modelled fixes
Date: Wed,  8 Jun 2022 08:59:16 -0400
Message-Id: <165469315859.3617056.6079537945668451155.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220526151018.3134454-1-peter.hoyes@arm.com>
References: <20220526151018.3134454-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 12:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3486

On Thu, 26 May 2022 16:10:17 +0100, Peter Hoyes wrote:
> Running the FVP_Base_AEMv8R model with the cache_state_modelled
> parameter enabled exposed some defects in the U-Boot BSP patches for the
> fvp-baser-aemv8r64:
>  * The MPU memory attributes are inconsistent with the existing MMU
>    attributes, causing a model hang when sending packets using
>    virtio-net in U-Boot.
>  * The instruction cache was left disabled after booting an EFI payload
>    at S-EL1, violating the UEFI specification and causing Grub to hang
>    when attempting to use dynamically loaded modules.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: fvp-baser-aemv8r64 cache_state_modelled fixes
      commit: dd8b6c1dbe02666a2d4e372dabf832dbfc2977c8
[2/2] arm-bsp/conf: fvp-baser-aemv8r64 model parameter update
      commit: a8cb33d5139e30b4a643da9a277487299c0e658f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

