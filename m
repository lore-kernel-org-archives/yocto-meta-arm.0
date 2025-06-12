Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF92C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:05:34 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.11135.1749729933315629216
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 05:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eWuEztTg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fac7147cb8so15182736d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749729932; x=1750334732; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+f/nF9WHb3Zs+uO4xkGsewQHHrDq2naoRt/d1KHkzI=;
        b=eWuEztTgmU1xlmoXBAj7NpxGyCupdLJhKydyIpDfIf81fdTa5V5PJ5hKnv+BRGs5hd
         O81b24rCmJmUJU7TaVf8oSwxeBatAVXADfS1VApF4QPWIfZqx6D+Z4xPZFvjLX3uvpXb
         z5VwrPrK49f8vFnbYD2PLzlTwu2MZX49yge0SvxkytXx3N29MTglictdG4tjHqG3msxQ
         yALCxJaflCbTBbFP285wWJXAxC8+Q7cyr0IRKNAiRbbOGbTbuaW3h2QRVkROMO7/4do4
         gCOJAkY/wSFsbFSaaC3j+bch2vsbpUK5VegMa6a7/hoFJq8IPdXEcpjHNsbYbPIVK8gO
         HbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729932; x=1750334732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+f/nF9WHb3Zs+uO4xkGsewQHHrDq2naoRt/d1KHkzI=;
        b=jgTmIzq7nDafZZJzVNFk1wXIrCzLSnBvYmALfsahQ6H0Gm8mziOi/vBiYTy9w4pIwl
         8Q3V3nyQPQwp/MN+61eZwGPZYOrxG5r/xRcg+3W/MuMGkg6ePCfTU93PfSaiemlJDXid
         VUJv53clOvgRR8V5eA2TkXqeXVripu5QvVu9VjHxAUDDBMfAg4PU2Zgcuer8WFcE05/H
         k1wTOtsFqPmU5tcNDtVC2oobqsOvQw0ZYNX0ImIteg1kGYBUw1bzNJfqTCQ/aKFuGMOu
         k36DTPVb7tF7hfefAQAfTdi6mNY+uQrTD6HQrxUSpXcZeq8I5MkDZ5v2oj6D7cJEYzqF
         rC/A==
X-Gm-Message-State: AOJu0Ywx1qYNnNPClW6yT8fvj2JhuLZiLYCRU0CClCjG3nXgANjNuKlF
	PT9ZKriCi1MlFKv5TD1ZAADKxo3eIdHfdjr79T7hS3/lYgftXjVJNByfLlssh8QZCbIKKq/pKe1
	K30J3Lg==
X-Gm-Gg: ASbGncvsXsh7W1Q5EJs5pJBWJFWM9MjV8dIaWpMPFtwWMnPbHp//yAowh3Bo7t9Xt3S
	Fkw8wtvAoTP/fWIvkWTglJue6PtDEx0Jzeiq/0IMPbGduv2zGgINoHUpt9CaSyVYtiabMWiGbmY
	Y5ySrp/g0pRShle0i/AHfI7LJM2bud46/PLDT1k243OCcK85SoK/miw82YmXdmeVecsFyYMtEh8
	zPcze9tHQX8ZYv+u21Iyye0LMIVZgm5DRNiy8xVbe9/SBU81ANeOxjekqCyc4R8jAHkBkvTTz4I
	Tio0F3LSf6Nmrb80DmU3Lgn66FPrr/5xFdwOB9HKLKnnOpGcYqd3KA==
X-Google-Smtp-Source: AGHT+IFEEPSsPBiFopJzCx04U/cL8pdr695Q441jENohAc74/qeh/LWWbAcZOwwR1jemLKtfzzuq/g==
X-Received: by 2002:ad4:5d44:0:b0:6fb:103:bd1a with SMTP id 6a1803df08f44-6fb34662353mr50890736d6.33.1749729931842;
        Thu, 12 Jun 2025 05:05:31 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eacbbcsm32207185a.53.2025.06.12.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:05:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: update to 202505
Date: Thu, 12 Jun 2025 08:05:25 -0400
Message-Id: <174972992514.1787599.15685211132861227236.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611151611.58317-1-jon.mason@arm.com>
References: <20250611151611.58317-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 12:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6545


On Wed, 11 Jun 2025 11:16:11 -0400, Jon Mason wrote:
> Update to the latest version of edk2-firmware.  The sgi issue has been
> corrected upstream, so the patch can now be dropped.  Also, no longer
> seeing the RELEASE issue on qemuarm/qemuarm64, and removing that
> workaround.
> 
> 

Applied, thanks!

[1/1] arm/edk2-firmware: update to 202505
      commit: 5c8910e8c1f7cbbc1bb0dfd2f78354a731342294

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

