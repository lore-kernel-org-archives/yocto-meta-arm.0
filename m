Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4566FC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 12:41:46 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.7346.1717072898119733414
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 05:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RjqDZm+B;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-794ad6d2884so60405385a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717072897; x=1717677697; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJd/GNTGDkMr4YL1HpLgs1zBLvnJym7+ZrzTzm+IGgM=;
        b=RjqDZm+BfGysLRbnFVMvUItxiM2ZTs0mIx3TKP+e59x3kmCDM2T3P2PMP2h6Qt7Is1
         IQ96dkTeXnMP8AyO4sopraRGc56yqF37kGiTd3j2pXp2sZ0qchqNI2eVOoFWFZWuDbUF
         OaukW40AJlZ+PYZ64ha4XPStp/vCAKAJHShnUZ4cHmMqXwJsdpe9e3EXvsFrow2uIGCn
         QkYN92B1ohVgF1dXrg91GGONaywYkkWrVn1IdLOUsmbPH4ed2Qsf9KD7h9H9McaKPWo6
         wkKC5I3KzPM9X33tBO4BLcHPCU+7fZZS6xUousczW2sPdZsyYYnGkwTuZxCMo1nOfIlU
         pOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072897; x=1717677697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJd/GNTGDkMr4YL1HpLgs1zBLvnJym7+ZrzTzm+IGgM=;
        b=MS35JnTgOyuVjYIyElTuQySlUxUCd01aUO5eWbbITlnt/yThTZ5WIU6HGIxGaxH4pR
         /cE0Ks3VZLDy27M4jGCsIom+9Dop1zDF/cUqwQnGYRf7EWl7fr1UsYDzCQ3xMQ6kQJ9n
         HTkTED4fD/GI9U0eBvcF5GZOETIS6rrF4mJ1q9YD4dgrKKyDeVKOgwunVd42yUmEzreM
         8XGj+pF8iwypnPMoM4V5LN/Q7uqlHIOoFIbAQf447QyZ4PlU5XSraa6eYuvNhuxm+kqR
         d/11+nSdzGfewxrOccdYTn+npESa4k0EBQR6XrwtsrAanxinIAQPqjSMfIId9UuEy/cH
         wQew==
X-Gm-Message-State: AOJu0YyZTgoB7J1s4bwtD5xnC241e+RbfgXzd/ag4u0rdYXfyueuDtZp
	ET7zFgBRc3VvaypYO+cki6urs1gFohgxDePxSleVStrxkoTfObr+RJTkK9CA2PbS/Hineh1YKN4
	=
X-Google-Smtp-Source: AGHT+IHwi4OvsXqJNBmQ4548daM7KEVu0fjoMSXnvd2aE1dOEWH4eXP+SXLbKilZncUz91MJv5ZcKw==
X-Received: by 2002:a05:620a:8506:b0:792:de9f:fd6b with SMTP id af79cd13be357-794e9db7d50mr227791285a.36.1717072896862;
        Thu, 30 May 2024 05:41:36 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abcc0f04sm552868285a.42.2024.05.30.05.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 05:41:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH scarthgap 0/1] arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset
Date: Thu, 30 May 2024 08:41:24 -0400
Message-Id: <171707288468.1718187.10632103487234052118.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240529172540.699780-1-bence.balogh@arm.com>
References: <20240529172540.699780-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 12:41:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5776


On Wed, 29 May 2024 19:25:39 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The reset on the TF-M side caused issues after the capsule update has
> finished. The CapsuleApplication already does the proper reset after
> capsule update finishes so no need resetting twice
> 
> Bence Balogh (1):
>   arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset
      commit: 77284072201fc6fdf040e12e8ab23958ee4df566

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

