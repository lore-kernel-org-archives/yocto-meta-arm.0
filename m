Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD5CE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:02:38 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.82054.1734444158106652548
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1N3qx4HV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467a6ecaa54so34039141cf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734444157; x=1735048957; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C3u9Wd5N1Hrm+T959S4TsJDE1oNV3gBySFAWsacqcU=;
        b=1N3qx4HVJwO8l8MitFsgrPrGcHxsu4u5S0QJTK1F6NLPIMHb9aTwJebm98wy9hYVmS
         XwzwL0Y/J7Sf4sH+r9yDMWTVFN2lPfFgYRvEYCqOQHdB5DlTwgpXRfkhmCHBVDCcLyql
         GO3EV1gXgfMpwIYBp53we8JfY3kYFyFkbJuq00HH+ZA6UTyghUXuY6vdls0ZIB0lWekM
         TMIu3wSZbyetriu6te9UeLXXDWiHa7JGCJeCCC5IOo/jMAFNpF5sgYVHZBvDFFiMUNxl
         9jEtsjTP5jeiKuy3OqmOSTBKYJdacfLoHUDLBLmLhjGALJC1FjBa5IL07FUIa7EnnSzP
         kxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444157; x=1735048957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C3u9Wd5N1Hrm+T959S4TsJDE1oNV3gBySFAWsacqcU=;
        b=oQuU7ekVB7is+gg4T4ffTCO1QIs+oavZfXcDw/gZeLwWjH+NR8QESwy8XjZ9o+Ke3B
         p/l+/7pGvHr1Vbf3l8+ACr2R+K9WKdEsrawe6wFc4vlLJMy4bUEjQMw363xUExvBkaWp
         agUuhdgZZyutX4woxJKsYI6ZBVn4g8IvNntriFw+q66YMuih8uoSKAsAwamt0fKZRUbu
         AaYCi4oW3aelYSA+UkSm81No2+B4FEs1vUQkBXWD79D2ZjEfSCEza2JZmV75EmgVnu2S
         AxvhWt/l9eNDUFZ6+oRhkUoHSlMaSZthewbqa+LuIhOsYRC3zoAlXPEZ99By7q3IXhzO
         eWmg==
X-Gm-Message-State: AOJu0YxMeG3sG5Noo4cNKa6NM86ZYmin60fXFhAPguJA/h/yQrHHGvv9
	FsZyX1AoXgcUvJ1ezX/LLgxhRR2tjlw/AgpSGZQwNn4vlDYF/ZIgSH9uGFuyAGJ7Y5Lg9VjeB5M
	=
X-Gm-Gg: ASbGncvlhuEz2sIXxu6oU0N3ifutS0VX52s4OuMs0bUahj3uMacaLyP5ThEZBzeApLq
	/P19B0R5WVm87axSUvFUJxGWHwIch9I2nOijufEbe7lENj4In3hfvlQCcIMTBUTJgr38t5ZTDMP
	i8fF+ixz46Mkzj1ucBYD3lrczku2bnjS2xHFBXQAYxPZDyShsKvC6G6/G1Mqm6W1j0vS4/nSqpd
	KVcuP+uYyKUenWNlTOd1WKscnAN202j1232YdH1kRmxIHSX
X-Google-Smtp-Source: AGHT+IE2ylbjvbHH8k4iimCDBfC7cBz+lAN+mZrmLZDGsZSFy09ubXVlKRHi1CsobTsPbP1ro3Ymeg==
X-Received: by 2002:a05:622a:488e:b0:467:5367:7d09 with SMTP id d75a77b69052e-467a5755427mr252805891cf.16.1734444156613;
        Tue, 17 Dec 2024 06:02:36 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e83181sm39347861cf.62.2024.12.17.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:02:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jamin Lin <jamin_lin@aspeedtech.com>
Cc: troy_lee@aspeedtech.com
Subject: Re: [PATCH v1] arm: remove python3-pyhsslms recipe
Date: Tue, 17 Dec 2024 09:02:21 -0500
Message-Id: <173444414285.2113109.1276563620165356584.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241212021256.1911359-1-jamin_lin@aspeedtech.com>
References: <20241212021256.1911359-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:02:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6293


On Thu, 12 Dec 2024 10:12:56 +0800, Jamin Lin wrote:
> I upstreamed this recipe in meta-openembedded/meta-python,
> so removes this recipe from meta-arm meta layer.
> 
> https://github.com/openembedded/meta-openembedded/blob/master/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> 
> 

Applied, thanks!

[1/1] arm: remove python3-pyhsslms recipe
      commit: 22de236233d4c53ed86d04364e003e41f77abfc5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

