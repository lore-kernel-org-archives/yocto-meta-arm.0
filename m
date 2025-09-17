Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF851CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:09:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.36393.1758146952788738791
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VwfjmFuq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-807e414bf03so42616485a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Sep 2025 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1758146951; x=1758751751; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5IwZrRXXW0dmDQmGhK7C675l8HtHiJpHCN97eCENvY=;
        b=VwfjmFuqo7vfiROSjQpwxKtvL8XzG/ish5NdsjqBD4U5l33ZqD+Xgps2JqPhUQTgXI
         /4sF6AM+Y6UBC9/ib+Vs+2f64vBeh8YK8WlcK81fAJTjQEDvbGdE/i+Voh1wwiCuX+Af
         ZRn8PCydL9H2yITlnYi0G8lb5JbW3nUiWI+wyxxazvQ6F65fQTPWSIGpVrDIZ7OHm2R8
         3YHM5qaMY2Lg8Cu5uyBXMEEEcWcMP1TI/HL4tOkSlaZ/w9B1cHt1s9L3k5BYa6uyvEp2
         QOQ48eIWWpZs+hylbouy5yuzzrE0iCEasINU+y6dhhz/agdB4SJGlM4d6X7/clkyU0ZV
         V58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146951; x=1758751751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5IwZrRXXW0dmDQmGhK7C675l8HtHiJpHCN97eCENvY=;
        b=IdIpZ3ssbRR7BArw3BFbjbgCn71S/ZZdWijaSy0KgTsb7hp+awXGvBW65iA9Z8eG8a
         vBMrp/feKlxJrtOvuKGoi2AZFki1g5z6xjaLzmXMopOVx5f3BsFw2MgnwJexNHczfKNn
         OxtVqxbxdKBqaD0BYr3NS8gTJeQCLCmP5co68k6T+q6JrpR116vgS/XovBgx7jxmlcIX
         7HUGLxmSqCedT2AAQMQzNhBk6x/yJJZEo9YSbauJVGU/qmd7XeEAM8mV8cXYMyatLa9n
         bSMC0+iDPkKsjS7DAESeEReN9Puu4+Xcdfkz7+ldCqLu1HP/H4PvAEDLK96BTcB+Vst+
         mRyQ==
X-Gm-Message-State: AOJu0YyonsvdeEut+ngwH+nz/QouDkkce3kCrnnAGgPorQbaZXN8D8Bl
	O4Cvqrfj6Krbi0CI3DdW8Cv0jt/mq9j9Yd5Zvr6ar6jH7ieOgF1OCMt/dRG9fUjgKwYmz3P6Nxd
	wOugg5w==
X-Gm-Gg: ASbGncvDmYPlzddaE1NoKhZWGtgdHm7A1ugs9hMiCKha7NS3XXEZjsuDLQQnh9tB5e3
	7ZWXk3WgxtxFjc6zNuzI+3+U0VdolocPoXIZalvkDqogpDMuVqYpi/JP5Dtsqnw6Fi4tZRdxlNo
	7zqOSCAct5RhsyyfRX1l0ci2hk/OiC/zDv9fVnyp5ahlwsY5J9/P5y9KcSsvlYUo3dQREyeL+Ua
	/1FFwuqmQV0jOeORlXS6JiffO9pvQRhIPizWlKlLFX1lDVLVFyRmXKstEHWVbqW2gLL4D03EPWj
	a7YpNVL3NCPjIO/UZSCYwQRVdOeJXiWY+LnPEZDtPoOmXit8WB4fDSaJtdg2Uk9apRjwOEdlL83
	jtngE4OhY8Ddm0p8eBf/OxRRKvSdXsCPv
X-Google-Smtp-Source: AGHT+IEWKRfm8tZLP2Z1nUKWsbpjmWbbEQWjgwNZ+XDvKlIuDVKpP8wMgoNytYNfok8ADo8s+U6tmw==
X-Received: by 2002:a05:622a:491:b0:4b5:edd3:ddd6 with SMTP id d75a77b69052e-4ba6c6b42a5mr41950491cf.82.1758146951406;
        Wed, 17 Sep 2025 15:09:11 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda9720984sm3925311cf.42.2025.09.17.15.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:09:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/edk2-firmware: update to 202508
Date: Wed, 17 Sep 2025 18:09:02 -0400
Message-Id: <175814694291.1711824.13667509545871824405.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912212725.95249-1-jon.mason@arm.com>
References: <20250912212725.95249-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6715


On Fri, 12 Sep 2025 17:27:23 -0400, Jon Mason wrote:
> Update edk2-firmware to the latest release and update edk2-basetools to
> match this update (as the previous update did not do this).
> 
> Also, fix clang compile issues.  This change should fix any clang
> compile issues since edk2-stable202108 (completely untested, but that is
> when the relevant variables were renamed).
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-firmware: update to 202508
      commit: 51d7581e2e714cede4233e82bb0e8f7de51610a5
[2/3] arm/opencsd: update to 1.6.1
      commit: 2e0a465789742e434ad551f7674e9787fabe05a1
[3/3] arm-bsp/trusted-firmware-a: remove unreferenced patches
      commit: 7800703ba5fdd39eb9dbf53b28627932d18acdc4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

