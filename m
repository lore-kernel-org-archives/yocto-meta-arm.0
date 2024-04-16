Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94291C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 02:19:05 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.10670.1713233936659059836
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 19:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Q45YAXyG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d68de297fso319332585a.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713233935; x=1713838735; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoFapV9PRq2GQFuXFY97Yxe8wN+5ORLogmBbjKJbPwU=;
        b=Q45YAXyG3Gw18/zh0lwPLlfhDOyzy3Td9HrB60ISzQz4kQ8weyFy9uAdXA3qqYVFy1
         +VxTjrhAOuS60aAyeipXGkW66uSGSO5pVYvQB9T/KgkWtezp5Phv7YcBuzhFSf3NwLUF
         z4AbHUl8/d7+EjTv9rXMMOIm2zHTb+vfOzR5aTV3CoXkTHTaj+hi4PGyCWTszoJCmyg2
         76jCLBgxJy5FxcU8tGTTWEQbjFOA7V0Dm3ZmVjwQBhCbUJJik4PnnoOLx3nn303Tgx8D
         OQZuCmq/mpUXB5oCyTovvZiEr6IrEaeBoel3mwN/r/ZawLIWxXrIouKFffqVjrhONP5y
         rB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233935; x=1713838735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoFapV9PRq2GQFuXFY97Yxe8wN+5ORLogmBbjKJbPwU=;
        b=PWq0fEQfRot0tzHJM83n6CRKDsspdIEQgcZx7RMTZsOytbzvZqwRXqmgRv6/Zhi9hf
         aEjZM37udQVEhiYvNu8/LzLys/A7FE8sSpGXS3kBAZCAAqNni7A7o4DbJPl0tsSpe39k
         oaf7nCTqjkZ9MZgZSxIlojEUftC/6RX2XeLWCKBEdRqxw5aaWrKXWbY/GoLzcvdEfGv+
         Pd0y3ZbkLMNpH0CgRmAksqklf6IudSM7KCt4xKnaXfV/4qJ6LMRelkG9w98rv+BFve3Z
         VhNnpDih6lg2A1PYtF0hLuX2VAzZNOHbmTFR2m/PxdoghoUndWToxJ8NrVqXezYnKumZ
         skdg==
X-Gm-Message-State: AOJu0YzcXkmKT4qqBp7d1WXsBjYh/ESfn4qLED/ggwphpBsGvgJ3j6TW
	22Gfhm4SkRYMB4BQwDOpaDtVN8bO7eFu15AA3ks72P9AWJ2vcDkikMzoSsSvEbp7r0lFWUoZb68
	=
X-Google-Smtp-Source: AGHT+IEU+cvtgvsmAGx+NNkuVcVe4XI74nKyAENqop4UcNRnNixO2HaewQmIkC0Tl9ucvaDBgSktWQ==
X-Received: by 2002:a37:e109:0:b0:78d:6dce:acc2 with SMTP id c9-20020a37e109000000b0078d6dceacc2mr12283137qkm.26.1713233935617;
        Mon, 15 Apr 2024 19:18:55 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e14-20020a05620a12ce00b00789f3c50914sm7129725qkl.33.2024.04.15.19.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto-dev: add bbappend to enable this kernel for our BSPs
Date: Mon, 15 Apr 2024 22:17:59 -0400
Message-Id: <171323387901.3101369.7451000436279293560.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240412135710.229421-1-ross.burton@arm.com>
References: <20240412135710.229421-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 02:19:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5548


On Fri, 12 Apr 2024 13:57:10 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm-bsp/linux-yocto-dev: add bbappend to enable this kernel for our BSPs
      commit: 888a527676fd0cf4019e72654d8d58270849ddba

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

