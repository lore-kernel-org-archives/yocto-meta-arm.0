Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDDCD3443
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:32:41 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.26441.1725377551817977644
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 08:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=q6mMM4Wn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.44, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5dfa315ccf1so3264932eaf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725377551; x=1725982351; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2SkmKvBPRQocUdm50MchajVu0WhPsr7/siJS/4cTaQ=;
        b=q6mMM4WnOuriwo5uouWq6sDu5yREkcOEc1R9nKgWIscwI1rdrnWntXkqcVS73jed8I
         L+0yR5VaO66X1xsnSQh0JfqShX/kj04P+ckrtVGZejO3iKmgvVEQQKDayUK6GQVFlLD3
         TBEBYgjJRiZdV/u38oPbaXKmZpjGYLiiFQyzRejJqLCHbVEEAhM0j38feb3XZxz0K5zC
         tDkltP3D0IrBzYciLD+Z53ICbke5Ob354wSLmto8qWMvfOWA7fr0Ep2cCyfNUzS657yK
         Yr8D9K2isnYTkR0XaxoYH80Pi1aqHopXCbofSi5jxo/Xl5SfgTCZUVup0l9hXRwtWNfE
         Ywxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377551; x=1725982351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2SkmKvBPRQocUdm50MchajVu0WhPsr7/siJS/4cTaQ=;
        b=M0fyGiM7DfFclr9IF9S2n1LGGvpCocnVUHunI3p1ATFg/iv4suz02WYuwmKjaQDN1j
         K4i2HgMoX6gOSZkaKCJFbdtCBe9G/o0xAYu7yzM+sw5G9GnLPFWyltmi8zE64D3ledIx
         cD98yR9hVrDCYnlu9wQpyE6UHecJth9vEgLzTINcsJY9B3hlqMUkC4gQND7GyMFNj97I
         rHtOuyqtaDEaoG88Gd6OcBSqOrQt7xu+gsV51y6SLLckTpBBAe0/5M7FhuXQV9cxmggf
         XMJRZWu9QNO2FP6p7zlXan5q5gRoV41iFmhojZHRWeTpQtRH0e0NpJ1V/HHxmBVKU3se
         sniQ==
X-Gm-Message-State: AOJu0Ywv0kJzfKGTAjggHsADE88EhIu7pQRpf/s7+7aSmsXKrV1b+nZy
	U/IIO2KeRF0Mq5kTrl+QjB9xbZNxWP/KaK765RybHUMB2/tx44czSd+fu6Dydo6vojDVVgDghqk
	=
X-Google-Smtp-Source: AGHT+IFA3sdqv8CbRBNJZMC8hq2ESuf/jtyaRQkeVFxg1Fcmj+4GQTP4OwZgxIvOKqqvAq08nwoF1A==
X-Received: by 2002:a05:6358:720e:b0:1ac:62de:6c16 with SMTP id e5c5f4694b2df-1b603c144aamr2237459455d.8.1725377550503;
        Tue, 03 Sep 2024 08:32:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bfc197sm537846285a.7.2024.09.03.08.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:32:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/3] Add Secure Debug optional feature to Corstone-1000
Date: Tue,  3 Sep 2024 11:32:21 -0400
Message-Id: <172537754407.2698594.10733293104008293756.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240829110505.55826-1-bence.balogh@arm.com>
References: <20240829110505.55826-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 15:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6052


On Thu, 29 Aug 2024 13:05:02 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The patchset:
>   - Adds the psa-adac library as a TF-M dependency
>   - Adds the necessary TF-M patches to make the Secure Debug work
>   - Adds kas file that can be used to enable Secure Debug
>   - Adds new CI entry to run Secure Debug
>   - Updates Corstone-1000 user guide
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/trusted-firmware-m: corstone1000: add Secure Debug
      commit: 7e94669f60818e198d7d9aa25e7d0cad05c86047
[2/3] arm-bsp/documentation: corstone1000: add Secure Debug test
      commit: db2b46a464560f8fa9960efb96193e664a729a2a
[3/3] CI: Add secure debug build for Corstone-1000
      commit: 36e8641cc9ed8efcd3d4ced3dd353733a40403d5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

