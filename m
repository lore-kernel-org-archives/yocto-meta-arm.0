Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B892C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:46:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.26560.1712861172794270683
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zWTA+Ylw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4346e50ef62so1237481cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861171; x=1713465971; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VNaDEB/dwypj0ILnBwjci9LDEuhn/PGBoAXe3EBaMY=;
        b=zWTA+YlwEhr7gLVWEhIARyV3vm/X4Ioi98vGzwnihsVWD73e7+duPM/rx7cl2S5FnL
         V6dUVl6zBxDgsxRyVFXFVwPhtlrovGWsXjdCDPdNmw78xrszHBVeYoNPy25DS8FL/6S/
         klA98ysCdlt5I0rWYsocYI5MqxJ6My4teDJmbYZJ3qDCR2TzGAsr/NyhWsiNE136Esn0
         xf4NF7UAluI+C3lE57xx8sDCO6VsnOBoGGgImGW7bsV24yV/K7twj0Ej9G6/J5y2zu86
         7hovR/m1G83obXB86SgqKs/0dWWZnw2ALhvsugWKFUfXIVi7E94nLYBFjhTDMfVEgQAe
         LYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861171; x=1713465971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VNaDEB/dwypj0ILnBwjci9LDEuhn/PGBoAXe3EBaMY=;
        b=UbmZei9yP3LYNCUZdGgxMmPvivACScwfaTUX7Sh3SnMf4rF7EIk49ZR9s1CqrCKVrQ
         djBjOs231pz5dLDkZlO3/j44vQEFx6lncmpNduNnyEIv9amcEao9cQ5XJ1ybTKFlf6jw
         0ZpUKQYpuillbmDXsROhrp4VjAajzoj4ukoyrEUSac5/+17Qj4qJRIRURE1AUbjCP0g6
         U9E8sjUzK2DIqc7lIkJmFLha6/pkEnDvETO0p+oj+vXmdSBalCfUBTikCwQPYz7lwR4Z
         xnBRy5NX7K3nDzBH5xZZjfLRl8+Sz7G4Xtzx/gdVWsO4JRUyhYru5Y092B31cLZinPr8
         cuhA==
X-Gm-Message-State: AOJu0YxgITMdpTz1wnXvwE1ecAYKK4coqNasAaKelHRJNpLLhcxlMJCk
	TFFTFlLJr9H0W61KWh4THG6SznDSEScaxGzahwKbNWNL6FCMURS4rAuEWTX7ynH+GmBqDQVYar0
	=
X-Google-Smtp-Source: AGHT+IGpcH0oZFntsWDvTSk6hqgWmbAT310tnqbBG+sFSPHliRi1xIAaxK8vqgI8Tce4ikMEmhOiog==
X-Received: by 2002:a05:622a:58f:b0:436:78ab:f850 with SMTP id c15-20020a05622a058f00b0043678abf850mr909898qtb.32.1712861171705;
        Thu, 11 Apr 2024 11:46:11 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b4-20020ac87544000000b0043480a0fa12sm1229183qtr.18.2024.04.11.11.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:46:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/optee-ftpm: update to the latest SHA
Date: Thu, 11 Apr 2024 14:39:09 -0400
Message-Id: <171286075123.2560674.5569383065068665324.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411125947.64959-1-jon.mason@arm.com>
References: <20240411125947.64959-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5530


On Thu, 11 Apr 2024 08:59:44 -0400, Jon Mason wrote:
> Update to the latest SHA.  Rebase of patch needed.
> 
> 

Applied, thanks!

[1/4] arm/optee-ftpm: update to the latest SHA
      commit: 7df4fb66ab39a53d9eaab3a5b682f715d9f62db9
[2/4] arm/trusted-firmware-a: update to 2.10.3 release
      commit: 46ee22faeb7074c07c9937a877cc4161c01fa165
[3/4] arm/opencsd: update to 1.5.2
      commit: ee8933dff16bf5bbf34fbcc0317b865465aa39b7
[4/4] arm-bsp/corstone1000: reformat u-boot patches
      commit: 17df9c4ebc6614da641dcb9e85246171d940098d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

