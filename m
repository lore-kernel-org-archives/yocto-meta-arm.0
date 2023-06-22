Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77797EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:54:08 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.15273.1687449246366772169
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 08:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=MaBlj877;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.54, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55b85b94bb0so3919156eaf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1687449245; x=1690041245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doXec03MNij9zvVQ5YNUrIMrOXw0NKu20f9GbZuNDRI=;
        b=MaBlj877OLHj+cuATFEwdTbl/2iHynkQfTrSTznLZYfgh7ID1rPBwplbh1kJCSaFjs
         sFDdXSF/GCP/vMSGW0y0LzXLHIztBaH2nx+WKBy+5Earg3CG2vh7zvCGrIwIgtCS7ZGs
         EpeS+0EvUND/H16CFa10K6Eh3PeAEOJMCiq9MDSjbnXBuxsJdDcffkK1qAml4WUpGkuT
         44Eq5WxXkvzdrdZFT1g1EEaNPON8TCfq5/49eDW5tq8/kFyLehwNhqy2Ncxl8nKc9L8d
         eLavoszepMuCcsSF3UmY4Uz74nwks6iDBpqmIN7oRprBO04Gy3mvvQcetVaDmliqZYwt
         TXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687449245; x=1690041245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doXec03MNij9zvVQ5YNUrIMrOXw0NKu20f9GbZuNDRI=;
        b=jeIfDyi0Q/kr0rNuknre0WB5c0eQ83Rbjd2cJg7B8hUDqcbZ4Y7P1fbymFUFJI3ALL
         0b2H5gB477V1YecICSME2p33USGJzZWMAFUsbKIrwz01+GzuPlcN9CnQ+SSi143M1kBw
         rArnodv0zSIxUJBWNMW/9MBu1mrOio/oA1ausDQPMOllOu8ohe6jXn2Y+BpAnWot7SLH
         m3wqZyk5Mg8S2f6V5RDcXox8sxD1TzB0GLqplLBTilPZxyNxP04DvCnMl08ufc8bsy4x
         nvh2qiaIXa/qFpV0rDakG4Ra9j+6OGxdcWDV5voHtaBFsViGAZPDTLhfvddsqdfODN2S
         Wjlg==
X-Gm-Message-State: AC+VfDzWWVrFmM+3KoV+8CUOnXEsP5cjMnAKvaVR6A7su2RKoQhIvcK0
	RBvRZiLsgLzo08g7Ql0Z2GuQIbczSdslYhlWBI0=
X-Google-Smtp-Source: ACHHUZ6Y/Cnlt9eLlRJZl1CYnOBxFT0i6S2TyWGbhycMUzsgYX4CP1zXZ5W0gFoYeub7Jv6IhhIkJQ==
X-Received: by 2002:a05:6808:1782:b0:398:54a2:a9bd with SMTP id bg2-20020a056808178200b0039854a2a9bdmr17090899oib.46.1687449245095;
        Thu, 22 Jun 2023 08:54:05 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id mg4-20020a056214560400b006215d0bdf37sm791959qvb.16.2023.06.22.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:54:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH MICKLEDORE 0/7] arm-bsp/corstone1000: Various fixes for upcoming release
Date: Thu, 22 Jun 2023 11:53:51 -0400
Message-Id: <168744923385.118182.2898796794819273177.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230622131628.11573-1-emekcan.aras@arm.com>
References: <20230622131628.11573-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4833

On Thu, 22 Jun 2023 14:16:21 +0100, emekcan.aras@arm.com wrote:
> This patchset fixes various issues on capsule_update and SR-IR tests for
> corstone1000.
> 
> Emekcan Aras (3):
>   arm-bsp/trusted-services: corstone1000: GetNextVariableName Fix
>   arm-bsp/trusted-services: corstone1000: Fix PSA_RAW_KEY agreement test
>   arm-bsp/trusted-services: corstone1000: Fix Capsule Update
> 
> [...]

Applied, thanks!

[1/7] arm-bsp/u-boot: corstone1000: Fix EFI multiple protocol install failure
      commit: 1cdc2fc2fbb4d2f60f0bc2f1e7603717ab8a901e
[2/7] arm-bsp/u-boot: corstone1000: Enable EFI set/get time services
      commit: 8a014d897876a02e6293ad08fc3e1657e8d47ede
[3/7] arm-bsp/trusted-services: corstone1000: GetNextVariableName Fix
      commit: fa6e20d33b0944ead2a2c05aa1befadda67ae020
[4/7] arm-bsp/optee-os:corstone1000: Drop SPMC non secure interrupt patches
      commit: c99ed29ba6cfaa1efb614bce6ea3060123d828d5
[5/7] arm-bsp/u-boot: corstone1000: Fix u-boot compilation warnings
      commit: 8cd16aabdbe8d19ed7c844fb239d2b977c30f4d7
[6/7] arm-bsp/trusted-services: corstone1000: Fix PSA_RAW_KEY agreement test
      commit: 6b1bf55b942d543b885ceed9eb66d43d4ac658fd
[7/7] arm-bsp/trusted-services: corstone1000: Fix Capsule Update
      commit: 7714ad8f552ce9f377d31baaf07faf6d758c43be

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

