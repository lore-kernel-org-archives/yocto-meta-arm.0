Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0441EEDF02A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:02:51 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37379.1770868963926642228
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mNyhdEN4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c532d8be8cso712804885a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868963; x=1771473763; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=korx8PyRG+H7jHmBTNgyyLJ+4KEChjWhzG3byKQlSqs=;
        b=mNyhdEN4xSnmlKMcWzyNcg9UU0HfZNshg8gtO9s3JH0HyrGo09mCvTiUv845Gt7oV7
         oLKsfblsMcx+AH2egaujyZhpekTTi9vuop5AEMV/cfml4iedpb17RlXl6Xu2Nh5N5GWY
         Dqv7GUOOjOaBeqmOrwX/5lRyeHXzUZlbTi8DYyXQIoTIAPAghzH5wPKkWB9fMfDHRlde
         hIRlhkomF3l4bvB2FnRDiiyp9o2d710KWwGfpVBGxbtt8lCz7A1Lvdx6h3EseS8CKa0g
         z5/BERy3m/c7zqt9r0ZOG72EkwHPzcdXgt5A6byXiUimdZxS6ucmuqohZj78Uj4eS3fv
         VbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868963; x=1771473763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=korx8PyRG+H7jHmBTNgyyLJ+4KEChjWhzG3byKQlSqs=;
        b=HDDsGaw6nO0AaaXcrqSVUtkXhB2loeb8XEMnG1A3hxBXQaOE72X0yLhErUbANBRCXh
         C3TjHk34WDhGVIghsNMz7XfUl39z4wvUUf9u6MJWmRNu9pgzJz4yJYOwBcPf20BoQfe+
         mAFbfWgzn9Xn7JO2klPonRIqoKjreKUcC5scTyUxK5AdKfPqe7XXSHtZHG8cBaKjHth0
         eVElfdBF5skDZbQkYuN+rrKucG+tE5B76M2zPSU4HS6pfHKA8CeCfppUPLs4mGMsHEh/
         ibFybF6h8cu5sUaA1wCsbrdBy2TLJyt63DXqR3BnH4B6jxn5Xf3zhQdSHM9+CLQjK9Uk
         9rqA==
X-Gm-Message-State: AOJu0Yx57k3xj0IJhIyrUUSSlXwCpuSv9St7tLZOLchh/0LAkF9+y6M8
	vRl1nTMYHta8shBGSNa+8NsV70B4Buipady28Vokq/H3msojmUDYQrPrxP4xRaEatwXHAFX+ssm
	J958=
X-Gm-Gg: AZuq6aJNUaTsgIPu86JjdbleHoyJ7uQiEYeSGEcUTQGC3a04VhX2esqn80Ig7sCqcV/
	/xDMge4fqAkguQDdykCxpJzkG1+dSpsP6i5cb4nL7juw/yDN4B776gm8gMc2eDz+hEFMYbc2kBr
	iJ01+ytbgRrFuViKJrTl6RGcI1Po5k3v0gE1Ua/R4gR2T4SXulml5i35IFRvDK7bOBfvYCaUfD/
	8mmF9QQ5m29/ww89pH6LIdeVuYh9uYo/amOmqo6q+CFIdyc6K2iSr+HAtaCgYuV46UAT17GDB0i
	FBR91jvNuX4RcfakgdTDKVELqLApNtsLxIJ2GcqQKB+MkuWY3XsoJZJcOOHpac2offRUM3Tr2fQ
	2iSagYRF5jn8jEtHGD7mBXmXj4lOh81oa2bPvcKCGC83xWSD1rRT7fmHXMwO0c4hj1J9L+PEXOk
	77uHfq3vDzZ3/L
X-Received: by 2002:a05:620a:29d5:b0:8c6:db9d:c99f with SMTP id af79cd13be357-8cb331bb7bfmr227728785a.87.1770868962555;
        Wed, 11 Feb 2026 20:02:42 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdc18dcsm29961826d6.47.2026.02.11.20.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:02:41 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: Re: [PATCH 0/3] cs1k: U-Boot Upgrade
Date: Wed, 11 Feb 2026 23:02:27 -0500
Message-Id: <177086895276.770080.11689138926337965550.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210171242.196332-1-frazer.carsley@arm.com>
References: <20260210171242.196332-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:02:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6904


On Tue, 10 Feb 2026 17:12:39 +0000, Frazer Carsley wrote:
> The attached patches are related to work in upgrading the Corstone1000
> platform to use U-Boot v2025.10. All patches have been updated following
> a rebase from that release and one has been removed due to it breaking
> U-Boot selftest. Finally, given that Corstone1000 was the last platform
> to use v2025.04, that recipe has been removed.
> 
> Frazer Carsley (3):
>   arm-bsp/u-boot:cs1k: Upgrade to v2025.10
>   arm-bsp/u-boot:cs1k: Remove broken patch
>   arm-bsp/u-boot: Remove v2025.04 recipe
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/u-boot:cs1k: Upgrade to v2025.10
      commit: 0a8d300b5239eeed3c3fd24f8f2729b29caada1d
[2/3] arm-bsp/u-boot:cs1k: Remove broken patch
      commit: 7ab5353f1c177b7439a067cf0fdaa62d4ca4a76a
[3/3] arm-bsp/u-boot: Remove v2025.04 recipe
      commit: 8c8e2a5dbb5cc5479ddcfda88bc0c5afb3af51a2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

