Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A027AC2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 17:56:37 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.975.1718733392124880166
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 10:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PbMA2x7o;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7955c585af0so354656385a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718733391; x=1719338191; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQAbHsyImzoMOIkylu82neIMRgdgfPCnEvschqn0iBY=;
        b=PbMA2x7o9aecjfixs63iwBtsHBu88tg3RYCDwnecdM5jwS3Q/7iEFFjyp58iS7cxc2
         ku5Hhq20Ao5/iBeIOmTElFFNYDhlCz5AKnE4G0+iAftvPaz1xEsOEVFQMiyekuyWoKIC
         viufydDr2F2mqBKsSDOj9c2pgCg6ytmTVr42CuNyMSw0iMYUEu1b+G8ne9iIlpEo1inl
         aXR+0yYaKNF8gPOE6OeArM0sYd4CRZxEZbArChkHC20zsFGE5NjEPePNCuuy9CHm81A4
         +AofIQhmW51tI1UUHIx8YhX4RJuXZ1yynErhafle+Sjlptg+oqDov1K5aDqn9MJRJNn/
         Oegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733391; x=1719338191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQAbHsyImzoMOIkylu82neIMRgdgfPCnEvschqn0iBY=;
        b=KsN+XdK+b7fi03/VrchNWEGlk3ly8b8BYxYx48NBS9tPpLcrOE7lUF2DCsTv94jccB
         GLqz21nnWCjZ6hl8wq54RrQzRDf6mbiVg5hyNfzOw0pOo3Kr+0T/xZkMoqKDIU5IzPuO
         X9cBew7y4k0xcaGMHIbOPhEabHn7JPoC27l4inkmb2z2pg39yDCyhHQR5TnGnA/OHDVp
         YH5YUjknT1efGEmkhmwcb8s2XqXNd02BJ4IuOOa/IOMxtnpi5Gs31JOvcM2a/THbzsoN
         LhNLOvRQuWNScjvNQIexTIPtTdf0nyQqCWkNeeDycn93Si9e9G5ppZ4LPZXZN2ve9sXh
         oyMA==
X-Gm-Message-State: AOJu0Ywv7aYhl0uYiY/hGOcn0k7xsOmiDBMY32TwXVSZ5eW688221ILI
	//AeBwoh1Tjvge8VrpoJlpQxDg0ayD0yBXjNe+D8tv/WM3ec0AnB9goJb5xktpV+GnyZMVFT8aE
	=
X-Google-Smtp-Source: AGHT+IF9AGgekUV2l9uSIkh3DOGcIAoogUcIgO4nb7N8cbEXLoqF0wXE5Z2spxOjyTMzP4Lkn+J6zA==
X-Received: by 2002:ac8:7f01:0:b0:441:571a:25e8 with SMTP id d75a77b69052e-444a7ac0945mr4359351cf.53.1718733390801;
        Tue, 18 Jun 2024 10:56:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4421aafcf49sm47305051cf.37.2024.06.18.10.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:56:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	amr.mohamed@arm.com
Subject: Re: [PATCH scarthgap] arm-systemready/linux-distros: Add a third Linux distribution installation
Date: Tue, 18 Jun 2024 13:56:08 -0400
Message-Id: <171873337069.2601380.4247942360204155404.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240617175220.76562-1-amr.mohamed@arm.com>
References: <20240617175220.76562-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 17:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5829


On Mon, 17 Jun 2024 18:52:20 +0100, amr.mohamed@arm.com wrote:
> Add Fedora distribution version 39.1.5 installation to fulfill
> the SystemReady IR.
> 
> 

Applied, thanks!

[1/1] arm-systemready/linux-distros: Add a third Linux distribution installation
      commit: 88b78f55581dc10126d1f25473d1694c0f0d4a8b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

