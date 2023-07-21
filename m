Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAB7EB64DA
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 03:03:18 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.2885.1689908590501956925
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 20:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=SdzfsMVQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-768054797f7so143058785a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689908589; x=1690513389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5uZsuu8kyvw0cmEYeu2kY//C053ouk4J8+4CpQcqvI=;
        b=SdzfsMVQfM7gMtbLf41QBe6IY9xo3ZIPgNTFD4dHvHyGiC/XiI/sGRGHRfcoL6P5m0
         3XTQwF0DOK5FmeuJK401R7qyVEAMJsT0ZPoB/p0A/geue4Nxhon6ra/UofbNuL2B/f2y
         mWzvIKqyNuA/mgUraSLtFV7AgzBX5C3I9dMQvuhOCMpCXKGhXrTwjI0ZkQIRQA/Ristu
         SMS5t1AzeCYdIid29TIjogBetkpH9mhqdZHLMIwjmxVKE4gDoj+NDy9LnCufXq+1QTAD
         /q+PV33vVTOJHHvXOJDQeaAQh0p/6dOfs9oLA55WFQki9VwSZkbh4kRZlW4ST+3aP+ae
         nJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689908589; x=1690513389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5uZsuu8kyvw0cmEYeu2kY//C053ouk4J8+4CpQcqvI=;
        b=ZyTh5bo1gz2kyfqdpzsAZ6bgLW6ltvisQGqfUO3DDq081icClmed55jOLHJ7g8cayx
         ZpSqSSWWxoU3foJ4je/oAih9hIu110XTVTRr0aZVKkQ0AbmkFGOSOLSUFIC5YYLI7KC8
         uNMoxfgRZNciis4e9TcsNVWv/d3NP1d+I/itxA09lFgCzPd4qxG59vQ3SqrwzZGYPPU1
         FYurGR7suQxJngjge5kYtXYxzR0U7D2x0Na9Dcj8ms++Sx76bghW9+Ee2iKHiDeevIzT
         fJoW1hjr9KOP0ZgaWz/lGTkxPIK3tfEJ2Zfcs3ZaiHOy3GvT5zWfi0SoBMkROYtSyn/A
         1CRA==
X-Gm-Message-State: ABy/qLa3j6dRes7oImPKdk3puOJ2aXvtrY+drYkjXktDgmWOq49HH4VC
	aH3nXdLc7I5T5mkp5lO+lwEtCeTmRkk+wKsk/Ko=
X-Google-Smtp-Source: APBJJlFEsoDiQ5+tAA4lAslvvP1DX6rLROKuVbuOOga/2X4eB+UXsbrYv6Ol6p4cA6SM3RMu7GXmug==
X-Received: by 2002:a05:620a:4412:b0:767:ff8e:750b with SMTP id v18-20020a05620a441200b00767ff8e750bmr751441qkp.20.1689908589129;
        Thu, 20 Jul 2023 20:03:09 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a146300b00767660afed5sm790897qkl.99.2023.07.20.20.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 20:03:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/juno: remove commented out KCONFIG
Date: Thu, 20 Jul 2023 23:02:42 -0400
Message-Id: <168990856444.2431369.10530111449675615175.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230720153430.3580005-1-jon.mason@arm.com>
References: <20230720153430.3580005-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jul 2023 03:03:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4912


On Thu, 20 Jul 2023 10:34:29 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/2] arm-bsp/juno: remove commented out KCONFIG
      commit: 8f03838a72456fb654102e0f1355982080bbf234
[2/2] arm/linux-yocto: move 6.1 patches to a unique bbappend
      commit: b4d50a273dd3f6eb37c8fac8fab12d2bf70ffebe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

