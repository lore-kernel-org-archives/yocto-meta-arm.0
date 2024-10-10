Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77712CFC5FA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:12:42 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.52599.1728587553052295532
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 12:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cFw3lT4f;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbbe3f6931so11921286d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728587552; x=1729192352; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiDGbOEPvdEHFhMuo4l8Gs03uPx7c9vG+qVHxJXbxCM=;
        b=cFw3lT4fc1bVQ6W86OznF4trWGPaiiJ6lnz2kwEIg/48JOLd1bV8k0YCUFAaDj1gEO
         eS7nLxUbfP+CZJZICPs9uwZfuTgE1hrM4Vpmg9cYxd4jO0vAQtiGrgrCbI5OVNYN9Nrr
         vFJAIiyj9G/Tn2be484iJGMziZZiY076pLsuiNanFM/J9aAKnqJPr4LauqGx+P0ZvS0p
         XuYUf6hV1s8xtQg1mLQVCPQPsxpF3OU2xWhtsOgEl3FT1ptNL5MWRxSJzFt2w+ibAfOB
         2A1ecJUtdGHGnbM7NWVIa2NUy/Y357mPXeqVx4ZBYZ6DM2Ko7NKYza1AX9RsLEo439Oy
         EpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728587552; x=1729192352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiDGbOEPvdEHFhMuo4l8Gs03uPx7c9vG+qVHxJXbxCM=;
        b=OXDYpNJvElAvmaBeH6On0VUFlOvyVGkoqbhCPntGhk1ASaUUVrtBMQRGK/X2Vs+SLe
         gTLCvATZIFmdZTHnZ+T1N7EANDs2ZWBD/xZsK0OSl+bYD03I0dxkmXKeG+gzy/c4F+Fg
         cVOE9yeVe09PK2cFj3lZZaDEMWkqh5TNZd+gEN/8VsPjSbXmhohcq36RwY+LYxsWCCrU
         rCA5sCOmZNbEcWql9NNovVbjMDZa+dNHj2noA85RLqfmywoxIsJx45TqLX7bgsy56mIp
         mYpfxUZMgAbXlSgubP5KN46dJz17cNgTkUxK1wjiYuBrKO1xlykO1oI9H4oMKEJ9IQLi
         tvAw==
X-Gm-Message-State: AOJu0Yxg5ufxzjHbk0Rk3QaUVjj9opFxCxW8Hjr5i7RsYuriYmfdYpPp
	JpydKiaACxJBncS+neVpuNCfutGNm0h2oECXEibXI+iK9y8o4EYlV3RNmHT5Go1IwXkRV/OymaM
	=
X-Google-Smtp-Source: AGHT+IG3rmP37kOwvEKgWXai+0+ST6lBmWe0pJgp9L+BCuHiICegxiE3AibgjFfsbQs8BTaCu7/+3w==
X-Received: by 2002:a05:6214:5982:b0:6cb:d512:e6e6 with SMTP id 6a1803df08f44-6cbeff6043fmr1828986d6.23.1728587551791;
        Thu, 10 Oct 2024 12:12:31 -0700 (PDT)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe863152bsm8052006d6.118.2024.10.10.12.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:12:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v0] arm/uefi-secureboot: Add uefi http boot support
Date: Thu, 10 Oct 2024 15:11:39 -0400
Message-Id: <172858750055.591681.8899917931404805511.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007033528.784737-1-javier.tia@linaro.org>
References: <20241007033528.784737-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 19:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6187


On Sun, 06 Oct 2024 21:35:28 -0600, Javier Tia wrote:
> Enable network boot via HTTP protocol. Many embedded and server-class
> systems use network boot for booting. Enabling network boot on devices
> allows:
> 
> - Shipping devices without OS images. When we power up the device, the
>   firmware can connect to the Internet and download and install suitable
>   boot images for this specific device. Administrators can centrally
>   manage the boot images and configuration files on a network server.
>   This centralization streamlines the management of boot options and
>   ensures consistency across all devices.
> 
> [...]

Applied, thanks!

[1/1] arm/uefi-secureboot: Add uefi http boot support
      commit: a93bdc8e4ea60ef461dc7154145c15912f04431c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

