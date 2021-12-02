Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC251C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 02:39:41 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.3217.1638412781148424395
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 18:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=IGhFzwNu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id t83so33256381qke.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 18:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=neyUVOIT+zIi8LmdaeTRe8ONn5tfDXiA8aLa6LarDSY=;
        b=IGhFzwNudofs8mz5vh6qYfl1R10H2FfJ52HL3PfwOoSzk1aPAG496YM1/mzcW+5qds
         QFRioIoiXxSWcWFtsD7uG3Fuf+8Q0HEPbjEQZF+i3Kd9IYjQDr4r7ZNePzBMWxFaXlwg
         iFaflrVicxVveNhPdcMUfDkT/Jc3A5xfTBsIod0azh/JkO/rpMr6ta5lMtiJvD1JUtaO
         Ip1gXs+vgiRlAWvlmYt21xyhfvriogGTNvQetM6Nbvdzax/oajJaAL1D4FjGufFBhnBx
         TPxBfM8xYUmWKPB72DtD7dZb9wHT6a7YZ2ZBC8jgzY2l6Jv2CK21drX55765HR25rENR
         vcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neyUVOIT+zIi8LmdaeTRe8ONn5tfDXiA8aLa6LarDSY=;
        b=pFytbwC97mcZqBczxI1A2BF2o1rOyRFcm2dF9IP0Eyt119HiIuhlIp6MwoxT6muZgZ
         t09SR12cQtn7PouRK0T/LNJfKrEJC1JoEKLQAzwthJCq0a0Lqug9jX0Og90zCXoSsa/j
         FgNJnAznBntouvYv/9ESeMaEPN6H8YICvevkkMUxad+HzvZn3vOucJY97MioBBrO0a7/
         Nq8kXx/GI9jhbcTnaeUELFLAoM+eSbHsisV20u4HaOO2OMHCTd/EnJDiMXHX/aNBWNVj
         Ja7AEBouetUEv8a6DKbcxMv8Ogtrz4nx4eCdKOgtj4c44K7kBsU35mGYYSIMjNygkaY3
         aTOw==
X-Gm-Message-State: AOAM532sinHXS9CZXtRXJTllwQH2+DyqzAAUWJ+XiCQzhh4KWhxPhDW7
	egfJkRim4Kk0eJ9DOWEbHD5MvM6n9aO3JA==
X-Google-Smtp-Source: 
 ABdhPJz8tNSm5Fsv4MYEFWsJJf0L7ozOqdLC5/P0xw5mV+fs7RG3rPK5cnNZHEu6Hf5TfBh6r7rQ1g==
X-Received: by 2002:a05:620a:2905:: with SMTP id
 m5mr10316600qkp.598.1638412780123;
        Wed, 01 Dec 2021 18:39:40 -0800 (PST)
Received: from localhost ([2605:a601:a605:bc00:4b3:4af3:633f:a42d])
        by smtp.gmail.com with ESMTPSA id
 i23sm760100qkl.101.2021.12.01.18.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 18:39:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/7] arm/edk2-firmware: set invalid platform names for
 better errors
Date: Wed,  1 Dec 2021 21:39:29 -0500
Message-Id: <163841251802.24719.15022174165591234059.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Dec 2021 02:39:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2510

On Wed, 1 Dec 2021 14:57:23 +0000, Ross Burton wrote:
> Set the default platform name/descriptor to 'unset' so that build.sh fails
> with obvious errors, instead of generic argument parsing failures.
> 
> 

Applied, thanks!

[1/7] arm/edk2-firmware: set invalid platform names for better errors
      commit: c225b33f917c2d335299d7e0a3dc8d0b3814b85b
[2/7] arm/edk2-firmware: upgrade to 202111
      commit: 58707a85bf5bce60134450da3cfea5542db54268
[3/7] arm-bsp/edk2-firmware: drop N1SDP patches
      commit: 5a8fafb7962a9381c18cdb2c1fc3345e425e0fbb
[4/7] arm/edk2-firmware: set EDK2_ARCH centrally
      commit: bb2bda718635bed908afcf96fbc82a6ce916d968
[5/7] arm/edk2-firmware: organise bbappend
      commit: 282de87aff3c32966c61f4e45f8f2e3d49b36745
[6/7] arm/edk2-firmware: set a default invalid COMPATIBLE_MACHINE
      commit: 6c5086872a24f3d694fb5ffd46db356f5d4dbc8d
[7/7] arm/edk2-firmware: default to release builds
      commit: 31cffcd59c9b2d75a2ca9d7edf395c088a5c12f7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

