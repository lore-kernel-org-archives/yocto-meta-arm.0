Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAC2C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1914.1667847892509462839
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=reTh3Mwm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id c15so7430724qtw.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtIXNfZ4MnE8MJ2fC0P9kDhIoBXov8DuN53Yj1OOVyo=;
        b=reTh3Mwm2szNNQgL1BGOsqwTthJ3wSyv1JkxKkSJcE1Lb2DEyCOdSjlmxjswGu1DTa
         wPKiWZ5VqJJ60HoBqR41amNrw40xdeenIeeKrQbR7Y6RlwMU2/O1Sek93GGNxi4rBFJq
         YN9oNa0I1/mpJRZEteZN8UDUsxHXz+qEy/tNNFuxM7QnnODGubo2060eMiT6qR5D5YIA
         IVcDi7R62EWyZ6s9D/5gVUL+8ZaYZpanp0F05oCwxXHER3MYcz2+VRQ07s4Uc+W4gyJT
         7QCOiJ1B8k4h7t0SZGCX4Gbal1CQSAYVzaqq06MbKjTKbftbDCrbSX6JvS4NuC5KlY5b
         5YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtIXNfZ4MnE8MJ2fC0P9kDhIoBXov8DuN53Yj1OOVyo=;
        b=re5ozev5kgG+qvVjkU2QlumRo0vJn2fxy1feRiWMP8qJ+kLAmzG2fHOX/m2KncFhv9
         qcxTiBpDM9o5zNctbE2Hebl4ln1PcrOxLsxeRtoe3gY9/wnfUE4OwtJL6V4JJNqaEI/J
         eMezNpIp11FGwdTUnwidxpXbgZ5fewidHpMGS6IoYEiNgMWV8pa9EBvhELhGfDvyZdGJ
         krO+Il2aNL8EK9AhjzX83vTMIeeLB/XSsVLU6eoSH/3m7NCNYPaDRotQNikdAECnIgDG
         UH9BU75ddxY1hJRJIGuMSmbRTye3UIOzzr9AdIikSHfsMGHQitQsEnN3n38nRRxNk77t
         A1zw==
X-Gm-Message-State: ACrzQf3HxjBMEmugrWB0xscA9H6lADKG69kjLys/B5335XDVr/Bwhb+e
	SueRMs6A03f6NY9Dd05qcs6GdPeWT0rVDQ==
X-Google-Smtp-Source: AMsMyM75uX1bPcqGoE9hHjjh7MCtKGYiJGYSVt9Ej9xNAyy21NtozAmbCONP5KVC59GDj0w+AdUnJg==
X-Received: by 2002:ac8:4b5c:0:b0:3a5:3819:4f6c with SMTP id e28-20020ac84b5c000000b003a538194f6cmr27851811qts.115.1667847891127;
        Mon, 07 Nov 2022 11:04:51 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id x5-20020ac87ec5000000b00397b1c60780sm6501523qtj.61.2022.11.07.11.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] arm/trusted-services:check before applying patches
Date: Mon,  7 Nov 2022 14:03:53 -0500
Message-Id: <166784783591.2324924.917473797944489257.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221104145657.26636-1-emekcan.aras@arm.com>
References: <20221104145657.26636-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4112

On Fri, 4 Nov 2022 14:56:54 +0000, emekcan.aras@arm.com wrote:
> It fixes few issues regarding ts patch stage.
> 1- Adds check if there are patches to be applied on psa-api-tests.
> 2- Fixes psa-api-tests (crypto and attestation) for corstone1000.
> 3- Changes default configuration on tfm to accomodate changes in 2
> for corstone1000.
> 
> Rui Miguel Silva (3):
>   arm/trusted-services: check before applying patches
>   arm-bsp/trusted-services: psa test setup corstone1000
>   arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-services: check before applying patches
      commit: 3651527f577ea24bbb1bdcb3ef0705235a0e536e
[2/3] arm-bsp/trusted-services: psa test setup corstone1000
      commit: 9e2de7dacc355fc3def8bf54cd2d14595037c438
[3/3] arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
      commit: 8d35c5b5396f80523e73c493c936f60c8242d00c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

