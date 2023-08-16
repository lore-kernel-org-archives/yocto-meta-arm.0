Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DD2C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:02:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.161315.1692194534586813446
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=vf+yDCHt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-76d5352bdb0so252196585a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 16 Aug 2023 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692194533; x=1692799333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7S8NztF4gMJRkoJOADdtg1d9I/wGmvUxx/zWPsWtdw=;
        b=vf+yDCHtrUWcYdL6IRSD+lGaH3vWLZih1ZQl1OtD2XKl8TLzzytfQ/OW6/LoJMX3de
         xHqoZBgEYY3lvCOvWRkb+HdSvQXNsaQm1ECgS/K7Hr+yUyWq0A28cVozGOOVT0/niAgk
         r5IFgyl5qIp4y/Nb5RcMayrpLewHdAz/o3D5zUuclISCs4FK7n0uDqXGoRbjih8FccPv
         bZoeSumh82vWZqLhA+SLW1nNf3xyyFhHHy7FPj6k9LX+PzV/CR/z03oX+e+ZX3S/UFQG
         /epE5gSWU+23Z4KJX1zbMHjy3anr9jwk2q/iS/WeqJsudmnO1JMsy7IQ4LhvKA/jv9AW
         R95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692194533; x=1692799333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7S8NztF4gMJRkoJOADdtg1d9I/wGmvUxx/zWPsWtdw=;
        b=S0+5Ltk5f0qwhVqXL08f2XECDrJ3feECq0ARH4PNy9KU+31ckgsUeGHKUnYtv/zvYh
         AQqsPLLOvPgUYGVAyUzNihos/pVxGzMP1Pb6J0R0i6QTwQsMYwcATLiCcLjhc0UpWD3v
         l6XR70P69hh8uwp/eDaDatijzDf5N5B6b971FSNl7DodaLeGE3Y0TksTbONNgnkFucf2
         7XKerw5z4ZVMoedSVE5LKw/mJGJroAddCHSOnNMQkCpIjMCuwydjC2iCtLoMgty/nJ7G
         41j89jOGY6a2KOZgM1IeWS+HfU6TLsuMpfp6b1w7FJTCo3A6F5uWR67I7DFVH/vIE/se
         ne5g==
X-Gm-Message-State: AOJu0YxzO7rfRR3QU+qYFJHPeQw4HjrwaSylR7LuOs/s8lXripG8r8Ga
	Moq3i244gXPZOCnX2K/bkBhhtY40+xb4PA06xv8=
X-Google-Smtp-Source: AGHT+IFzAH3YpXs5FV86fhtyMiWdsWLRM/SD03Dkn4rvajw3USQeBL4gBDPq5IMBne5hkZskX6pPYw==
X-Received: by 2002:a05:622a:1207:b0:403:fee8:7fdc with SMTP id y7-20020a05622a120700b00403fee87fdcmr2284584qtx.39.1692194533082;
        Wed, 16 Aug 2023 07:02:13 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k7-20020ac80747000000b0040378535dccsm4471140qth.43.2023.08.16.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:02:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com,
	anusmita <anusmita@PW04GXMM.arm.com>
Subject: Re: [PATCH 0/2] arm-bsp/corstone1000: Add unique guid
Date: Wed, 16 Aug 2023 09:57:28 -0400
Message-Id: <169219424811.219094.5868208586707070204.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
References: <20230815142450.545-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Aug 2023 14:02:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4963


On Tue, 15 Aug 2023 15:24:48 +0100, anusmita.duttamazumder@arm.com wrote:
> From: anusmita <anusmita@PW04GXMM.arm.com>
> 
> Add new Corstone-1000 firmware GUID and remove previous GUID to
> be updated into ESRT table.
> SR-IR 2.0 requires the capsule GUID to be unique.
> 
> Anusmita Dutta Mazumder (2):
>   arm-bsp/u-boot: corstone1000: add unique firmware GUID
>   arm-bsp/trusted-firmware-m: corstone1000: add unique firmware GUID
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: add unique firmware GUID
      commit: 0457cfd605e2d548b7048529bf708dfbb5454796
[2/2] arm-bsp/trusted-firmware-m: corstone1000: add unique firmware GUID
      commit: 5a56396d80a0b09cb16945dccd0671583de01848

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

