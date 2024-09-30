Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF718CE836B
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:32 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.59501.1727713525634279694
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OJ66gJ/I;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e25cf3c7278so4140365276.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713525; x=1728318325; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJQObzZBhdMAenLKFIdYPSAfwtutc5iUMiORS421Y7U=;
        b=OJ66gJ/IaBrBCnljUVoqJKsafiT6YqajbhwkgcdFPgj0ZbxCcEwM6mqlpJqt3APnDc
         KM4kRl5HN+2CiZkUcp8gSe521xzaoDAuqxd1RqXVb5f8aUqwR6BEJgF+SZVCnajmkZsj
         ZvcBfDggsbNjpZwN4pDhi85Z4SI+h1D9ZRmuaEe/E3jKOyKiKlZVhmqr4a+swGTdnmtd
         AkWdUSOftoV5zLnGbz1HE1ibTqJAlBNE9jT0stiNraSMkRQtM93B1FvcJP1lLsl+sV0F
         svEB/pnA1lZtbNX85WbEMBvjhfRgIHpTblV0LCy8diAcpB2S6RzVM4YrVaNtupQ47l9D
         WzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713525; x=1728318325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJQObzZBhdMAenLKFIdYPSAfwtutc5iUMiORS421Y7U=;
        b=V5C44Uencc2gTDNklu2j8Ey6TO+Z39tVO5svvasEBhNpzyukCTZl67COXSqk+n3kaB
         hpU1pq0m9sUN0nzrTZ5ZGHzr8MtCm7thW/de+W8GcKY5XhEbXXIrlJY3UDGvWBNP3vq0
         itdy5NLpySVs9YvcrOSp3cqhWQrmngRugLcYfU9luKVwyiHOg2ggGc3SjNO7CZGf7dPJ
         7rci6M59N0UToa9D3Rgiballxv3ZXZ/j98UbN0vEyLdj1R8HVZq4PtpiVL5w0jy7z3sX
         nvoBWa/AJRndnmsU2KdxeQ7R/LczXYn3I7Ya0UmNRuxlqZGCtaKq7uhWtta6RbOWqskY
         BW3w==
X-Gm-Message-State: AOJu0YyJ8oIUj1KGhgwyeK65WSERoNrV/WvLboh1gUnqr+WujBgc0KKV
	E0rtHJtifeDHHMxPLElglKlmMyGTPLMPzsNb9xnm/1l3u4pav5Yzlkxp3jK/9hHMAH8cBCuXmqY
	=
X-Google-Smtp-Source: AGHT+IFWdJltTYUktTA8DOdOepJBHgZpV+LXtmTk+J4717yAfSNGyoV8wfmXdmiUWrjjALym0/IwDQ==
X-Received: by 2002:a05:6902:2584:b0:e26:f12:1dd9 with SMTP id 3f1490d57ef6-e260f122079mr4878815276.13.1727713521930;
        Mon, 30 Sep 2024 09:25:21 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6c31679sm2339401276.58.2024.09.30.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:25:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: MaheedharSai.Bollapalli@amd.com,
	michal.simek@amd.com
Subject: Re: [PATCH] trusted-firmware-a: fix panic on kv260/zynqmp
Date: Mon, 30 Sep 2024 12:24:38 -0400
Message-Id: <172771348143.724488.12349214062260917131.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930133929.10654-1-mikko.rapeli@linaro.org>
References: <20240930133929.10654-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6146


On Mon, 30 Sep 2024 16:39:29 +0300, Mikko Rapeli wrote:
> kv260 with optee and secure-boot panics without this fix:
> 
> https://ledge.validation.linaro.org/scheduler/job/93620
> 
> Xilinx Zynq MP First Stage Boot Loader
> 
> Release 2022.2   Oct  7 2022  -  04:56:16
> MultiBootOffset: 0x40
> Reset Mode	:	System Reset
> Platform: Silicon (4.0), Running on A53-0 (64-bit) Processor, Device
> Name: XCZUUNKNEG
> 
> [...]

Applied, thanks!

[1/1] trusted-firmware-a: fix panic on kv260/zynqmp
      commit: 890cbb98411407714224584e6b15cb1e7450a387

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

