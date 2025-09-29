Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF57CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:05:03 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.5108.1759169094687906655
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 11:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=uxr0CCDk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-85e76e886a0so355917685a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1759169093; x=1759773893; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97Utm6N+xFHmLnwPHTdZwOQ99A7YTJ/3dweq0SZDI9s=;
        b=uxr0CCDkfQTJM2NXIKonEC71zphs+uqQcFphqOz+hKvnnPDsHR+MH7Y00yIJqMZAwG
         5w3NHqEvtnVtdzFwAsel6WJjgmbYBa5xER9FoAEjErUli8KeEn0shj3+6aRndfdVcO3y
         sG3+paVaBozzxqxWXaTHCN8m3g7vVubz7KdNQfeC7F8Bu1pn0ZHMX9fXydqjUhpr1kvS
         igk95qEGenBw0SOTGDjx1p9YYAAwqKqyjoGqJJET5ZQQXjAVyVT1QvDfT/wSMXtOatVx
         47jdseLuJDHvnl2FarIfksk83EoceD028nhX3M9AF7pqjDD4mJWU4Kq7lvFA9usFTslE
         fz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759169093; x=1759773893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97Utm6N+xFHmLnwPHTdZwOQ99A7YTJ/3dweq0SZDI9s=;
        b=RGcYFp+BY8sdT/fcYaXjCQysGf7OMo0+oha2Xto0O4rbDh19YMzmy6oWFwaOFDpqUm
         mImml2eQYYTLi9QDAfF4uGmHTg0Q/K0gdHiXATbs8hSKDXmJDUPgX0FkebVmUJfkeV5j
         VsEukzqlCu7KSLXZW6BJt7BW6lQR5WjL1yyVDE9usiP1utASHsfJx3XFsi7paHf6S/em
         w2w3HyiLdkUgDf3ZK7s4OgH1u+DS/iECAJtmziG37IDqAy0+oNyelpYhvOkEeY/IoG94
         j3cHR4dsj5+5SLen7VsAe5smYbpWCz03MmgJ7X13h1zGCpepK0QqSyiDIfUj1Hxaq3Si
         5kvw==
X-Gm-Message-State: AOJu0YyABBjx+s2fkglWkuBr8OLwDX/fw2EgI1L1HP373aF+YhNdl/Z3
	/brxz7goOKgd+/2cOQ5wLJp1uEhmNZiGI5HqfdMGqdsthAavV/0g+dfKBGLaEoaUjZrcKcNvnjE
	AhE4=
X-Gm-Gg: ASbGncslXP1l/L7KQNMCcOowOz4BgO3S4SXFvltlmpr6jNoIgPV17VyxQS5ojU9rSVT
	46WSIAJaBK9NDlzziu0GnPoqXWy9dNA00EybzRrm4r10HqqOWD8kbeiIKo71VDqjhCDyDPXlCZg
	2ikMeiCpQlGZrZg413yjVtzKZWU9dUv99r9XxKQReAIwbisZUjNXUcicKX3Qxl76mj0e+CnKnXo
	nKoignGJLyV6SWBJ5jjaAzg5oiOC/DDFxjPcSWG7OdJ3ga1lJ01eieVwnBQbVPYAqtwatC8S7fY
	5B6uQZ7wBJtjbgB+uJ1d9N9DxLiERzwAZXPnPybHAAIoxvpvWYdWaxtAjRpRSOogoEYFRpOxd+s
	GT9uQv115fHJ4Ig==
X-Google-Smtp-Source: AGHT+IFEvfECu0yeo5nr+TANAies73Tod+WELUO/R1GYAitGbWE/USyySm0bBFO0kYFumYtKo9fdtg==
X-Received: by 2002:a05:620a:a486:b0:85d:aabb:47ee with SMTP id af79cd13be357-85daabb4c77mr1746928085a.3.1759169093395;
        Mon, 29 Sep 2025 11:04:53 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2737b07fsm862749985a.12.2025.09.29.11.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:04:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/juno: remove BT_LEDS config warning
Date: Mon, 29 Sep 2025 14:04:47 -0400
Message-Id: <175916908716.1386479.12137581739666481247.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250926124753.64145-1-jon.mason@arm.com>
References: <20250926124753.64145-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 18:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6720


On Fri, 26 Sep 2025 08:47:53 -0400, Jon Mason wrote:
> Kernel builds are logging the following issue:
> WARNING: linux-yocto-6.16.8+git-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
>     [NOTE]: 'CONFIG_BT_LEDS' last val (y) and .config val (n) do not match
> 
> This could be enabled by setting:
> CONFIG_LEDS_CLASS=y
> CONFIG_NEW_LEDS=y
> CONFIG_SND_SOC_HDA=y
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/juno: remove BT_LEDS config warning
      commit: c3b9bc549f49e7b8ada406150637c685eb222daf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

