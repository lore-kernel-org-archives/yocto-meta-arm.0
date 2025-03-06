Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C041C28B25
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 15:41:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.16699.1741275679116875478
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 07:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VoamG9xv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c3b4c4b409so126532385a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Mar 2025 07:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1741275678; x=1741880478; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubDlp1yf5TurW2Rw9jkXrBTcCmlnFbida7Lh3Pjw0UE=;
        b=VoamG9xv2YZeaC+XXt4mtMrVA9F+BpQd1TnqT7+JI8M2lB85m2rSZLrqGF732sjxCb
         qQe0PVzJWzcz9UEZRrG/G6uboycF132j0Bunv3fHLufKEo6meZH8hmvx8/AJO1uhA9FJ
         bqVWD9/FDY2Zf8lRwayarP76NNUAT3Y29khul+60eyrzFaVykVz4Ipi4gErxCwq4IUt6
         GOfqCfQgOVWDiK0jcqtaEuivND/FwXMRQuzeyALlk6o/BH0DOhB5wUcCDJ2aQEaSyFTe
         N7Om9ip31PhKyQxwMiAVrppUO3mQw3JHrT47aTRZuJLjU2EUHyTDt3P5bFdZEwMzK2gl
         o5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275678; x=1741880478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubDlp1yf5TurW2Rw9jkXrBTcCmlnFbida7Lh3Pjw0UE=;
        b=tJneoHYNS0rqqDs5viFm71DG0pt8uwfJ7ke9f4h7S9YHPY4m0FSSa76vnieb37hmRQ
         L/JsP+dOzDhiyCjRFGp3vjy2Vr3d2KMa5QMxA+lu3Ik4ClPZ8L4XTeUShYVnUyN32oKQ
         SC4Vllv30W7bohIBjiYuRZwldtZZu2QhhJVzy8oXWgLy8ffy701jc8x5hTzdLyMhp3qi
         RmXVAVlTu/ykt9jP1lCI75V2ODBU7oBxwLyv5gCCofbJz9aKosk1FmqofubWenSJq7OQ
         xFnDeHPjaV7oyASi4SvjCx8nEIN0Fs6yPi8rkLpstxvOKJG2GsDIo8J8KI90CPLBwzJk
         SRvA==
X-Gm-Message-State: AOJu0YyU8qY/WsQm15zik9OKOGCrmZUAWWT86KcJJWNV0TKQxlJOjPgH
	w/i31k6ketE8m/4wbwoXg8+IGrSsskefgbhV0HyqmBZKsxYMG3GIvZMr3AIWwBUizfTkEg7yV/s
	=
X-Gm-Gg: ASbGncthcsram3ao3+F2cZbGqOdDiL2XM1FLB7Jiw8fFOS5M+5i5PjYAaALr+nIdHSK
	Io/F1qEXSG9J61CB329jam4bBRUsw+fkD055QgqXe+iNqj/cn7ENNRbC27MkzxCoeJJkHHGJ5RA
	4cuTi8R1hv0A4a4fvSpIwGP2pa0t8PSOHvxf02K0BLbiVWVVNdr2mg8Xyx04kRKJzlUrM7Kv8qS
	K8Gh3Ov+WqDcqAz8Jc0q+IxiUMEjE282knrf/T7AWQ+QhpArHuwQGcWvxV52IT4RoftNb5rjJNw
	B3QJhCUd2YxvAUIPXIdpOAqmEKUM9TUCU6eq
X-Google-Smtp-Source: AGHT+IHDfBX/J/XIeWmxP5mVpi0x/ezeD3tOuBCHLB2Vja44R9ATrIipUwAWUUgjTxSpRtMkyqKeEg==
X-Received: by 2002:a05:620a:4899:b0:7c3:c814:5943 with SMTP id af79cd13be357-7c3d8e1f77bmr1188487785a.9.1741275677916;
        Thu, 06 Mar 2025 07:41:17 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e538b41fsm104277285a.65.2025.03.06.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:41:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: bump cores to to v8.5
Date: Thu,  6 Mar 2025 10:41:09 -0500
Message-Id: <174127566895.1840683.17838531885827595967.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303203158.1235128-1-ross.burton@arm.com>
References: <20250303203158.1235128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Mar 2025 15:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6398


On Mon, 03 Mar 2025 20:31:58 +0000, Ross Burton wrote:
> The Pointer Authentication (PAC) instructions are part of v8.3, and BTI
> (Branch Target Indentification) instructions are mandatory in v8.5.
> 
> As we want to use PAC/BTI everywhere in this BSP, bump the cores to
> v8.5.
> 
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/fvp-base: bump cores to to v8.5
      commit: b6227e29625c2509b083092e5e10975c3b2d037b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

