Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0C4CD5BB0
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:47:13 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.7426.1695127625204104312
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=KM5KCuUY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-411f5dd7912so37138821cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695127624; x=1695732424; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0tVjkrCPeESIsYE3B21abCZOUMqqiEg6GRiVHTZgr0=;
        b=KM5KCuUYIxAYvgkO+hjBH53JjDbXDIPRhXMUAVR6xCgW0zwVegs+t4x7KCPcSwMvR8
         I2rW25TKPa9dP+Q6rGsFqqW+YTBDOL/uXevrUjAd6YmDX+40mvRrGcrWkBasi1pWk4gD
         nZEIo50GIdhTToSwOJGWLCN8aDGo8TJuvFy/m3UokfST2sgTzZQL3N4d6srYvn9kMqKv
         WEwSFN8FkE07jTN9Qm6jmQLMLlIVlMivYHiVwo7965ZrOT17vIcsHTT8L98HUUHUkrjA
         EyqPBz/Hw1FTwbjTirTgFdkt8dMnleQZ77Ui03neSaJnUyGx475uDMgZqDh7xUAHi06y
         6A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127624; x=1695732424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0tVjkrCPeESIsYE3B21abCZOUMqqiEg6GRiVHTZgr0=;
        b=ou8t+gEYqRaFvmSgt6pfb5EikIFIrKmjnuzH10AteqmySMg0dnLJXwlxQeSVylRpPK
         VDSJ8coUd3kwojj5RgjDq6hYqS5pkmOJo1dc50LaVgSZrJYbiNlxWl7PsRqh5Uysw234
         zBqKD8AQshrlgSVvYAAZpvmAgKuN0FTR7eOYzu3mXsV7DJsNeYNG/utg8LE8VV2ckXSc
         rk3JBbI4uTpTDCrwqVYe3tw2w7fGOEHjvvVk3i4iPF7iMTfVEz55/n5O3/rK7b/Zwaij
         gwn5cNBbo/oAwMZ/Q9E2tEc8pj1KBxDzQrcTyPCd5wjSHYusPZJGT7DPkwroVQh6GGyY
         XA6w==
X-Gm-Message-State: AOJu0Ywv10k/q00OLbS9lzqaai8W6IycLFZiFoPqJCULUquUD5n9P/+q
	h+EVj7UEVo7sLDNOgbMDbXtLFvgVy8M+p6ejW8Y=
X-Google-Smtp-Source: AGHT+IHb5WxWppM3zEJd1wnF8bYaeMgO9TZtfPZ0WeEljyT16PUbRSVHJ7UJ53rkkZWpXTW2wgOW2w==
X-Received: by 2002:ac8:5f11:0:b0:410:a073:7538 with SMTP id x17-20020ac85f11000000b00410a0737538mr11031739qta.29.1695127623715;
        Tue, 19 Sep 2023 05:47:03 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p16-20020ac84610000000b0041096c33d02sm3747383qtn.17.2023.09.19.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:47:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
Date: Tue, 19 Sep 2023 08:45:32 -0400
Message-Id: <169512753655.938653.14545470007306400569.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918180424.26148-1-emekcan.aras@arm.com>
References: <20230918180424.26148-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5062


On Mon, 18 Sep 2023 19:04:23 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Enables handling logging messages correctly.
> 
> Emekcan Aras (1):
>   arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
      commit: 4fb79a2f7c10b397cd4ecb8b378bc5bbece935ea

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

