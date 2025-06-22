Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E0EC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:04:22 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.27662.1750604655940633676
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 08:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RLbgy9mr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d20f799fe9so413060685a.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750604655; x=1751209455; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDZp2Fa77fO37Rrpg53BFCtGTHyIk8p0cdXRpxZKrzs=;
        b=RLbgy9mr0IAf6MBXK1T1yN/bRW2XiFkqMQuXOWmLjGTp1dghgxegcljlgZvgSvOaPf
         Y1VxJUk4EO3n0dTlxCcY4C5XD+B72nB8eJ6+DDr4oU2E62rCFmLI/EhcRz7DN9C301At
         DENKV7QX5YljpPCct+jO1oSKP7ctjyRWbevcF+BG4vUoPqXLGFgiaXTJQibEDxHMni6e
         tWcJCPESC4S74PnC1E8ZejeRfaQsnYrSDN5wGjx0KSDYxJTTKk//zWj2kVP2ypy5tKrR
         x4x0EIDSA1kkkrA4LU5/4FzNIN3nv50/2m4uZeZns3inxrOECGvxLtAiD2jlEsnZQrll
         Orbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604655; x=1751209455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDZp2Fa77fO37Rrpg53BFCtGTHyIk8p0cdXRpxZKrzs=;
        b=KdeYlvQso+5/Kp83gFk7SOwBwp43+VvhGWfD/hpSvNK3e3NvPTFR0FJe5V08wllRP5
         St/38BMf3GLtNSp5x6UiaBEQee3uFBU57HYOGj17d99Ue5t+baHv/KSyPhDbuv6qN0so
         Nk270CRfUhPkD0nQOiLRp0h8vI4qNudw7nJ4RGBCeqzQm9/6tJuAG6haXnacCh3moXe9
         D6zqc+UW3Yop+9sY9ID/NQOSe+psnEi4K/y0XvZQOMT0DNeojWrk2BqAL19ebl/HMHNE
         qkJIwXkf5X/rloORrKzddiEYc13hbx1O4BQ0JP0Sq8bvcQ6bqgDrj5uoH6pMbEumiOsA
         I/Sw==
X-Gm-Message-State: AOJu0YxEeS2Ywg6wBlBhYUK9m5POjknn/38HpHuHwo6A8UzcART0DCqr
	lOnIw3cgzDp9s4KgENMjn513fIvfSK601CCxniuTQGAzkNPy8f/Rk5s7QQGj2UvAy/GoHEWEWsk
	ufIw=
X-Gm-Gg: ASbGncvIbm2i1Cimz7sfJMeHs+vWbcKVMv3+HtFvknSKmIIOw4nTGIkxAvpFO+fC6v9
	wvZiJtFwPxLT/n2xF+wdgnNcC5fOGWuvs3AMGxDgvyyHYQEKGliNXywT+5iHRJKe10ZtLI7zcGK
	RNwB9fzc0WfahScN4kGoIY5O48uTPMpT3fPfqJVVAtgvlmo6kHQqPc1e8E9nisbbemUs4+8RL8v
	qVCaIgiPgHhRl5f83r54u+awgAF5oNLoUTDTw0zn77I+RgyKQCuQAg5mujNCi9bJF3o4pGyaQtd
	g8ABXXTME5ihzWUDc+SNHiPi2ftZu7SAKF6Au1CLGSD/A8uPUED1CA==
X-Google-Smtp-Source: AGHT+IHnFEOOXIyPl8haGQO+l1VFAkvQmMB4LORjqDAVJQMSRHBosnIzyiEqu3pf0HHfV6s6RZLgDw==
X-Received: by 2002:a05:620a:4110:b0:7d3:f0a3:dc0c with SMTP id af79cd13be357-7d3f99561d8mr1389440385a.56.1750604654794;
        Sun, 22 Jun 2025 08:04:14 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99efab4sm299164185a.76.2025.06.22.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:04:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] Add whinlatter to compatible layers
Date: Sun, 22 Jun 2025 11:03:51 -0400
Message-Id: <175060463220.3865854.9069954520255464716.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250621132738.83559-1-jon.mason@arm.com>
References: <20250621132738.83559-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 15:04:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6578


On Sat, 21 Jun 2025 09:27:37 -0400, Jon Mason wrote:
> whinlatter is the next release, add it as a compatible layer
> 
> 

Applied, thanks!

[1/2] Add whinlatter to compatible layers
      commit: 33895ff71cdf5453d135780e15af19b27633efd4
[2/2] arm-bsp/trusted-firmware-a: fvp-base prepend fixes
      commit: 43d136216d5760734f6dd807b100fe82fd6c915e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

