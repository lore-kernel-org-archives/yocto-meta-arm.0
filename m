Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CF6C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:46:08 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.26559.1712861164353863127
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cIx4O2Uo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.41, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6eb55942409so123024a34.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861163; x=1713465963; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbxxGmlT5+JzTbEQOJ5l09WZUvqtzNs+5b2PMAlP90A=;
        b=cIx4O2UozF+n8ZLzasD7UJpwsxv0+JuubBQixxe+ttNVOW9lIqj9B0k2M7Q3K5Ve9g
         zv1f0hXBeFHHKXEcoew5ZD8+lOH3LtaG5iHiEo08EfsW7lqNeAjACcAFmuB9hAzm9HPI
         6JltMkIpt6u8znzKFXmKD7i9BhnnoacxHjug13cGj8NS+69hwS8OsRdip/aOT6cf+60i
         PZAIucAA6fvKH07NsgrdvXg8jcaAQhTPM6HwW1HBYjBj4t/Pzi5R4MDeU2pvxpm5j+ZU
         NW32BFoxfU6BjIUSw3vXg0ZPIUp85MB/NZRd2WowR+1bdNoiU2CDh+YrBnrWu7S+ggEM
         VhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861163; x=1713465963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbxxGmlT5+JzTbEQOJ5l09WZUvqtzNs+5b2PMAlP90A=;
        b=Dzf36TLPRFDM2wxonYsPBGWQm85Wx5raSZTq4krBIjlBYjZ2QyviOF8UTbqxJ4idvi
         d6A5BQx9cFaBPDjFYNqkVvcwOeF5hePJcaONeNmy+kEtRPrgPvhXLdQkjLGQ9YicPUik
         JVYj9u0+GutPNo2MvRnI+rt4LiqMPz+vn9k+WDEVhRS0UUZGAZnm+sTqW+cEGnNo1MWy
         bvB8gOhhYaPYG/JZAQLg9d+oyPfBMkUgTGM+dVq6wXr/uu2CKw2hrLIQFtI0ZVrcJQ8D
         e0IY9W6riS494RKL3uytxpF0qVsCOEHJegr6gLouBkYAU44WsHkMldn++d5AdHop/C5j
         7zng==
X-Gm-Message-State: AOJu0Yzzg/s4VfO+74gMnkgj20AEOtt8WeJA8YXd+3d1bMVs5HDvp93E
	r13iWiiWT00CJi8Cy6p9d1Mk9/ZZNW/89refL/ebWdRNzly6OvwBxNeJNAfGRd3Kl9HYC8dGS64
	=
X-Google-Smtp-Source: AGHT+IFAhRT9r3r0nYeNbUU9rvz9VveJ9kNt0WxwddeCcXaZPG7JcA7a+ZUnLZd23lIjmfUoX/SW6g==
X-Received: by 2002:a9d:68cc:0:b0:6e9:e8ba:842e with SMTP id i12-20020a9d68cc000000b006e9e8ba842emr494987oto.7.1712861163458;
        Thu, 11 Apr 2024 11:46:03 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h7-20020a05620a21c700b0078d72553055sm1355523qka.11.2024.04.11.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:46:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp: remove unused recipes
Date: Thu, 11 Apr 2024 14:39:08 -0400
Message-Id: <171286075123.2560674.10600885503385617646.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411125913.64905-1-jon.mason@arm.com>
References: <20240411125913.64905-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5529


On Thu, 11 Apr 2024 08:59:12 -0400, Jon Mason wrote:
> These recipes users went away but didn't clean up after themselves.
> Doing so now.
> 
> 

Applied, thanks!

[1/2] arm-bsp: remove unused recipes
      commit: 2021b81dc5fce00667f2a2774b02abab5bf352e0
[2/2] arm-bsp: Remove tc1
      commit: 0af53c6453482a15395b86a107805c72da114c1c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

