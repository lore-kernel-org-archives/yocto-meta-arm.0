Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D76C7EE30
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:47:03 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.22600.1751222814322765693
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 29 Jun 2025 11:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=q37btHXK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d38b84984dso620796885a.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 29 Jun 2025 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1751222813; x=1751827613; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUXTWi+EDFOV67niY30PzaxVXXqNqG0i7T4HfKpuQJo=;
        b=q37btHXKu16Z5U4oyivsOgAUIZS8EUZAtyoqMVyTLJiUAkXFNcXNFZE23WyUyq9t4/
         rX6XsotoNpFD9UaJvoLpj/OX+JhCLRZFo9K3UdLjClKWQl36xhxDMfffEZEHgpKrW59H
         WSW5asImtPcILelw1I6lUYqps64AWNyXUyU7lHDNwqHW4654q+yQHYlJHaTIJ6Z8UVqy
         Go8KkuQLISwFCiRlju84UpG9erv7gLjhcSmhRtWyO8OW+HoqJ0/K5s6x6dWAtsZnOAEr
         qeJd9Ehc6PV3Ipc5CvaHM5xYe3Gdf2eI2grSCUotikayWPbILqVX5jqBbZGZeNDUb3IT
         EnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751222813; x=1751827613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUXTWi+EDFOV67niY30PzaxVXXqNqG0i7T4HfKpuQJo=;
        b=t5S3HpeIgvvaY4GC5PrHPS/jKXDx13qXbSpuWArzerPUWpOiZkIFvAybWN9NyBYAHc
         REsI3PAoXs3tboUO2OxNK7SF61wAT2YvPIR+PMfMQfOPaujPvQsokUTL3usjRbV9eIwq
         IZV7PdJa3dxMErgeCi6SkliW6ReAUZdydYY23VvwmI1Z/6q5Z4MeTAY/i6A4iBUJqcD5
         lupBBsNl21Sd0KXHjX/AqmOpX0dL9A9vr+T1U8Nkns7C5dOZBO9LPfHjqQ8jMfTBcMfc
         pdW7EuSbo2lSbLaBLQhO7ou7mXWvX2HiibgEqnXL1n2HCw7tE0RNcS5Oz7TXSlkEE03U
         jVHQ==
X-Gm-Message-State: AOJu0YxyEbqd2RBIia0fYB29abGf2umIMwipfvCdf7o+ppiWquLqXmJQ
	IXMMebybdFHGHmczJTAejgLdRyt2exu9aTdcvwNEVX3cAvmFuVsSGwnMyHcn/xnSdW+vAoM9ESI
	WU4M=
X-Gm-Gg: ASbGnctk65G1RHZZFr78nL2kTAoUOyh/3JAUdilBXHW3HlW/sJwudR0lv+VJf6+HiMN
	75hw7qciWdlznpD8y6q/0IdX9fXeBYn8YcG97dsZnevngE4atBCsm87Qe09Yi8W0V+2X5QM7gDE
	UuElUrBqbUoe1+f+g9jQ1kaasx4XrrmHEGeCkpJYk1idJAfwJm0k6kdAE8UyOxH0PnQYLx+6SpW
	eXd0oGCO1ItVSz2aURlFXc5gHAYdA6HJhKEujaBLKd3utXZt6TWUQRmHTJlgeRNSA94N7wmku11
	CKn8LJlvaQPVpf7WKC+skTouK/P02LFb8bH1QbsBTx5K+wzakOfLrA==
X-Google-Smtp-Source: AGHT+IEHTBHtnb0+O8IEAVUzKFZZ6Ph8DHQ2Z9v/ieRKJfXQNa8jpSiORdqxn7AVmPf7Bic03xD1sQ==
X-Received: by 2002:a05:620a:f02:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d45b6828femr186388985a.57.1751222813070;
        Sun, 29 Jun 2025 11:46:53 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d442e8db3csm473414385a.0.2025.06.29.11.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:46:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Clement Faure <clement.faure@arm.com>
Subject: Re: [PATCH 0/3] corstone1000: Upgrade OP-TEE to 4.6.0
Date: Sun, 29 Jun 2025 14:46:42 -0400
Message-Id: <175122280396.1667135.14841010916169504028.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618081047.34990-1-clement.faure@arm.com>
References: <20250618081047.34990-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 29 Jun 2025 18:47:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6595


On Wed, 18 Jun 2025 10:10:44 +0200, Clement Faure wrote:
> Add recipes for optee 4.6.0
> Backport patch for optee-test 4.6.0 to fix compilation
> issue with musl.
> Set optee 4.6.0 as preferred version for Corstone-1000.
> Remove optee 4.3.0 and 4.4.0 recipes.
> 
> Clement Faure (1):
>   arm-bsp/optee-os: corstone-1000: upgrade to 4.6.0
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/optee-os: corstone-1000: upgrade to 4.6.0
      commit: d782eeeae4acf620c9e094ac127501884fae0560
[2/3] arm/optee: remove 4.3.0
      commit: 5f8b0d44c8bfca16adb4127a205019823ce2e8be
[3/3] arm/optee: remove 4.4.0
      commit: 54cb65ca03a663a66a6d88c3397b76630ce7b043

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

