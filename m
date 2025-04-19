Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBDDC369AB
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 03:15:59 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.348.1745032550710326221
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 20:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gDYfBbAT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso36672666d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 20:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1745032549; x=1745637349; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbOOaQEOQZxDL0hfkdf22Xsv7WEiTY05MtF8aK75lDA=;
        b=gDYfBbATi8ucOxXISKkvvRvPwHgCbkoVLxN8C0a3KJBGD+NbszN88ZiyaVsLGuTQ7W
         LyrZoU1iOqAdmz92PuKT6ppcv7GWAiMROb/6VQBLBCtJw9YKnY4vhyZK5/x+fdQWIIgV
         hgxYtrRiXSi7g5NCabqWr/31Pwi8b5ioUlwRLWp5CU5snbQljBWAB9yKBHHrUgJ1sPtd
         PdeOUFXTNJuGqqdWiBZEQ0OU42pIF9gK+j5IPLLTNcaHfllu2dp3cyxQyio5X5K+rvIN
         ziboXis4xWP1KHS92D65REar6W+oKCmb05lJT8D4m1Sftn1pBNyEL9TFQkEclqvpdhzl
         Zntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745032549; x=1745637349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbOOaQEOQZxDL0hfkdf22Xsv7WEiTY05MtF8aK75lDA=;
        b=IIsPid0AhpuCz97wIVZe8GHOWeYi62VobhAx2/5iAytmjRl7mKFjCMpOey9UICQNiH
         ZUscBO+V0m+M7YYykR3DxgQAcNgCjCYOFE4iJmWRY6MN3NSyQcatYexPJa63YrHN4e1K
         BLye1OmMXJB//n2D8V7Fd91LtblWCEyz1k+CmdCLTbagcX/n/f6Cy5am2I2XTGgdDGrY
         GKiAOnPq/RlReKc3Vj7wromPZIeErqlj97DFfcFCiPI6yCnoF9G4o8j4eOjNirSSjzmB
         ROoCsiMf5M/gAQyIfSwrr7uqwSkoJUEelqSwdh1ft3UAmoeWCeBy+0BbbfN4nxfL9bCJ
         2A7Q==
X-Gm-Message-State: AOJu0YzpJDSjWX3iWDg1acNGNS2DIjMfCVVqbxGTXSkQ/aXUcDszMgT7
	oZVNJyg67FgLLi8DuKzfJpS04Wuah07Xvl+uQYAb/olzYY8kMD/fB7pb63KZsNvjJXL+ZiB5ou4
	+mw==
X-Gm-Gg: ASbGncstXj3KYIhpJUzdgW3TmcuTbvThLrFXUHQEwmqrpG8QtIXe2VLeEzlF1DzsHhL
	PTtDDFgCg1DdB3oJatFCfE6u3xwfAt5Cho8Vz8M2SaQOww7qyfFAtfpYqDW9AaKuyhO+cB3NRay
	Ag+RJXQyxhW0G+2JlKJ4gY/Pd0TjN37lDsIwoP0TVw3H9UcI5i8YYjTQGDjTSzgMdmVjQEcAecA
	JeLhxj/2w3BjBTWuW+PFEYDHGwhWHGc0WSYBWBvKrnrvc3EGwNggGvSpUtrIYMyhk36TvXf31sE
	opYsMHb8RxD3uWodcGgMTmOGyN+iRqMk
X-Google-Smtp-Source: AGHT+IFudB8weGe7dDVYHFQLdYKEZ4D91LNPz39AvLHIDXzOaHh3k93QbOyj/mDv0/KskB+MS0OC9g==
X-Received: by 2002:ad4:5284:0:b0:6f2:c7b0:3b16 with SMTP id 6a1803df08f44-6f2c7b03d27mr47379016d6.6.1745032549409;
        Fri, 18 Apr 2025 20:15:49 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0cb51sm17313476d6.31.2025.04.18.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:15:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/fvps: correct broken versions
Date: Fri, 18 Apr 2025 23:15:35 -0400
Message-Id: <174503253592.2569909.6877452126538360172.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418131222.95241-1-jon.mason@arm.com>
References: <20250418131222.95241-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 19 Apr 2025 03:15:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6478


On Fri, 18 Apr 2025 09:12:19 -0400, Jon Mason wrote:
> With the change to webpages for the FVPs, it is not possible to detect
> new versions anymore.  Add UPSTREAM_VERSION_UNKNOWN to avoid the
> "UNKNOWN_BORKEN" when running `devtool check-upgrade-status`
> 
> 

Applied, thanks!

[1/4] arm/fvps: correct broken versions
      commit: 8b73456f13505c1efa02510b81e6b2daec04d402
[2/4] arm/trusted-firmware-a: correct broken git version
      commit: 4f343a1d07872a3b76463b97aa16cadc7f859c98
[3/4] arm/trusted-services: correct broken git versions
      commit: 3e7926598dbfd79787ca20f07fe1f6b1f3320ef3
[4/4] arm/execstack: correct broken version
      commit: 757b8e89bdac0305f2532163ce125c23f546c3bb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

