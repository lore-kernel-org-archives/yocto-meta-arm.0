Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03754EDF029
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:02:51 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37708.1770868968205234193
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 20:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Uw1ZUJ32;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c7146b0854so771134185a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1770868967; x=1771473767; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir8HeC/DL+9B5xSAdyaVwgg1FQHEuEG/ogJndP9R8KE=;
        b=Uw1ZUJ32l/g/Dyfsv8pnasrD9LmScb0oL+A+eZ7TxPxJuCxlnyYZyaPbK2ZaoC82uF
         RZtKAcw2lSWiofppwJsr+zjCk1DAgC3aw7lucfQxJR0VvUaRwb0Dk6YRvT8Mwlfu8Rx7
         flgx6rGU4iZkkzonNKRWNPGL/op6Hr90QOQWD/4EVOZOyOuj3gnd/WUON/n3EDnmNEDq
         aiCQCqrNd1/g1deX9iZ69XZ+WaDGU6tE8sGOiqkNZrHxPFQ3jtzs2ZeDYGsO5s7dd/qu
         gwHlyoBNpAfpY2zWjOU/Lzase9/+MLT1fMZvBoVlZzmzUU40q5I3XGrzPVWT2yHmkwYr
         HEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770868967; x=1771473767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ir8HeC/DL+9B5xSAdyaVwgg1FQHEuEG/ogJndP9R8KE=;
        b=La/Zu7ai6v0YqFdU7/CPhyV4eXT0PHxPmKBh9vixALPgyFiJDUAjazDb1OMNiKlj9g
         ZGnnN0e8I6U+wKh1yfePbICJ7wsFQvdwbKLTUFXxMKUId0hVWRJGI+HQOOEsDPZNz1zd
         DOz3z1sfg9PDOWZDUF1OJ2mWpO3gXzOx2ZFJJ7h6z/qB6Hv7TOLu3na2PTv3mZxOedaV
         Tgu7lJ3cRkfghExqudoW9h23Iu525UFBUSjv/jWnHxowcNHoDtK22+xVJKhKDIc3ePVx
         z9w+Z4K877Q5nTVhHr+H55HcEubXOdQxR2udXXB0uQMmPZ3msTzXC2OCyfi4tonBGsDO
         Y9Ow==
X-Gm-Message-State: AOJu0YyqCHg70bjSNx4i2r/Ro2kIzCB+C+WnDKZ+O/avY8TnSVikrGoP
	9JECLGF4w8ZqJvbgOmqbUbHw2IMibhD5AVoRrlqcQBFrAciQ6taPDMfYwmy6AUS2i54cDmxTYAN
	ndaA=
X-Gm-Gg: AZuq6aJvXmNLhIYZYww2LNg9jIJ0hS1EPzwj/x2+yKe+9cx+ZdPFVaVl/Bjy5zSqFIF
	4yKmVUoxtqPrR0jnalRo/VIhc1eukjEeg6wehnTl6c2JUna49Fx10BOYStBaiPjs80bn5qMTjsK
	6Ye/bBFBZHeaq9Jm3NCUpqzaUi9ESGrhhCnfvwbv+l6eSMmLzmpDBaLF5if1w/Hkf8WO0qQLDSr
	2iVRAPSZI4IvCvuuFNt+qbzJo0FYcDjX5VHVDmE5oTbhFrw1b+M/cRlkt6L0or8wdqUIdw83OBj
	DdlAG0F7WlG04C3utowLYtLitJWe6RqmCFYrKgK7dkghDYynbwMBk0yjBB7TSM//+sy+dF79rgv
	yx5ggKIwRphCp7a7rdh/uDUbulOz31/tdRsvMcUVYd6TWoxOIDZEtNgf6hHVw1g1zMXoVJw9clW
	CErNj/RDl148nz83r5c0DFn54=
X-Received: by 2002:a05:620a:40d2:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8cb3307ada3mr200977085a.25.1770868967084;
        Wed, 11 Feb 2026 20:02:47 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdbd860sm29332046d6.46.2026.02.11.20.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 20:02:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [PATCH] arm/arm-bsp: optee-examples: drop patch included in 4.9.0
Date: Wed, 11 Feb 2026 23:02:28 -0500
Message-Id: <177086895275.770080.14501632730617642766.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260206180011.100173-1-jlu@pengutronix.de>
References: <20260206180011.100173-1-jlu@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Feb 2026 04:02:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6905


On Fri, 06 Feb 2026 19:00:11 +0100, Jan Luebbe wrote:
> This fixes a build error due to:
>  patching file Makefile
>  Hunk #1 FAILED at 12.
>  1 out of 1 hunk FAILED -- rejects in file Makefile
>  Patch 0001-Makefile-Avoid-variable-override.patch can be reverse-applied
> 
> 
> [...]

Applied, thanks!

[1/1] arm/arm-bsp: optee-examples: drop patch included in 4.9.0
      commit: fbb2c0f772f39a3c710f2e88538310843d1cb553

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

