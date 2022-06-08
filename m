Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92CCC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:59:38 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.5983.1654693176552804831
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=e36RUm0K;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id u8so14395081qvj.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wnVG2i8C07hcJ6WGvjTUdYo/vZ3kmDN09CUIXRS5GpA=;
        b=e36RUm0KDXdbAMTipPb/AMwhCP/dweKn0hTcbJUkXtPTxoNivy3xAh0l+Qlvl15mbJ
         e5qHmDK47CKmlH2vDYWx1A568aC21nNqS3sAdZF2M3/tBLSN04ONWnLZqrCStqFFOTuZ
         zHhjFhNlY4UZ1TYZDaLmx79mWetqk/w5XyNTjOOaRium2iRc33ByyN4V/Bm7Jmrx3agN
         0qW/svoW7xSX73Vnl2SQlpREYyLlLqiteaqUa9CbtAKai/36KXKPen0eHQ53vPGtMT0A
         z65Jv13FC9bspkehGNyat3T8GoQMJ8XPcuU8ITD1WZhmK34ryfMr/6ppqZINh/f8SkF+
         Zmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wnVG2i8C07hcJ6WGvjTUdYo/vZ3kmDN09CUIXRS5GpA=;
        b=QVaEtGOFPXvuIMWKLeENonUfOdDo3HTIl6PM9cEpMLxMZ7nOA2Oth5vUDy6jU1CXBp
         2Cl3ZBAmwDo6K04OGPMopcMxyeZYLr1kQjl2krAYcNtqM5gOV4Thi8FGNMO+CcC44fjw
         w0EQAjh2fexWih5B/plA3/RriXZclOfJOYssKf8oUChgiEROlgIXTpUPlZM5SNKxiWs6
         Rw1UnksNuP9OCL6chTBC9KAj7d3iFmwjIlmz9ysKITTEHHjLRF0OWkT5BR9B2tREAaeC
         IQg7hkSnoj/5TayAwRJ7zXIi/k/bUX/owO6W94rIibs5zWRi42JgoHBu9cJ5hIai5i/8
         8YKg==
X-Gm-Message-State: AOAM533fV2HWDHdByFGtWAakJTTbXGnVKCPTGnPb5s6ofsKe6UCY15YC
	k94NErz3qZ1Jvwi1/eglK+QZBME46h8p2A==
X-Google-Smtp-Source: 
 ABdhPJz0A3cjsKixM0zNMSifBHXMmqzYl+UjkcbtmBJYLfNB05f0CYVACb+/kQ2X7UVhAuTe8eYEtg==
X-Received: by 2002:a05:6214:945:b0:467:d6a7:d3dd with SMTP id
 dn5-20020a056214094500b00467d6a7d3ddmr22413166qvb.90.1654693175611;
        Wed, 08 Jun 2022 05:59:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05620a294200b006a6a3f1548bsm11732476qkp.54.2022.06.08.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:59:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	robbie.cao@arm.com,
	diego.sueiro@arm.com
Subject: Re: [PATCH v2 1/2][kirkstone] arm-bsp/u-boot: fvp-baser-aemv8r64
 cache_state_modelled fixes
Date: Wed,  8 Jun 2022 08:59:18 -0400
Message-Id: <165469315859.3617056.9947807424107053304.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607081114.976988-1-peter.hoyes@arm.com>
References: <20220607081114.976988-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 12:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3488

On Tue, 7 Jun 2022 09:11:13 +0100, Peter Hoyes wrote:
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

