Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D0ED46623
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 20:46:10 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.332.1768509966036041057
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=r1XyCSnz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c5389c3d4cso149434585a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 12:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768509965; x=1769114765; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhiJ3KNPDee43KD0K5UiYkzah+olwvT64ok6yJCjquc=;
        b=r1XyCSnzWYlNc2LsI6YaoiAAWxv8Jj9yoUwfSaNTAsPkNDtSSLyILZHi6CLKtC4nAR
         v4j+kMlKGUhBYKk8rSgzN62IS6eoXdbI5yWO4l+5Ge7BH5JU+D0kW7yAjV3AvJBhSwaA
         yGSuSPMNOkJ/2I/Oox9/aGjSMpoOp7BPNCj1iNjdxupWht65kd2T34uMBD60OKtviiA6
         A5i+ZqbJQCzoF98WYVhQcPhXm1cZQ/ipLZ90fvXZwDMIjmQQhDqTRNmFZDFFfX1Pvk9p
         bL/8+b+fdU/qSDHzp3XfTkD3+afgMbiiRrsXqLzII1+iLgqUkSDhsF7gk25ttuMWghZq
         dJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768509965; x=1769114765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nhiJ3KNPDee43KD0K5UiYkzah+olwvT64ok6yJCjquc=;
        b=qfUas/G+HMeyuM/4MrergkiJS5XxEzKFrvL5diQzV5HPsiPfP7oj8N+JfBDCS1DJdn
         KMXLC02q1KVqjH5KM/lkHQJ6cwFwq0fqAjaRzZCpWIK1fFqpSRiGne5neyINXbOn8LKP
         q5UaZhyH3OAJMhsiDfs/rYS/7RIt+1TJfc1MTtLYfEOPrNXPGKsljeL4PLhr1tHmi3oQ
         L4kTKt63IEwlxV+Fbj1WqWZLwZC5kF0jlRAapZCZdgoWwhMsv21i2xEwoTz1jgjDj8hR
         jISxuPqW1BZlUxnJyeWj6xLyp7icHdkbdp+HDHUSuEJb/gLu54zPEhm+Vm8pMI0KC1C8
         2lRQ==
X-Gm-Message-State: AOJu0Yy8VtJOgcub41KnsInCj9T3bVQfU6lw/KzWjeHfwbpzfb26n32P
	AnoAeLhU3KDtGNJm0jb5Nkg3txPljPOLSKGleAamMDS7OzoW3WK6SqTrU+un9kssBtIZXq4/4B2
	fNlE=
X-Gm-Gg: AY/fxX4ErcQTZlcJp0JE/smpoPc8paeN9MRVbi8Af8iBOr/3hdGUhXFCcwlRsWApZr9
	5DUXTCk5/Oilmf7WfulQziP5tER+PYllNIBkZfvgZgyzFZlxg0dY0BOxKWnrfRDM0IDCulKzEJ5
	oxpVFP/aZtrMLuEERw/v9ZuaegdLRq0HOhkh0uGN8IEYlF/Nhe4kNMnu2RVvyHDOMU3el0Psdl+
	b7pTQY2cA5KcN1BH6OPv9TdKNiRSbj4/xjTkfq9cbpYtC9JS7l5cvt9yWv5fpVshrIBVf9LMCKC
	eWuYAKOSbrl5nhUdXaDfs7/WKiDnutIy/0fJgRVKKATA0CPMEUSbTwrN4b7iB47EjYZhPgqdAw3
	HlUbUcGO79trdZgI5P1gknKH1l8SkdnoYRdjdmkP+4nEmQobs8Cg3ARyCOF4wXOv7q/gYbhQdJi
	m8
X-Received: by 2002:a05:620a:3724:b0:8b2:e986:26fd with SMTP id af79cd13be357-8c6a677a90dmr109272985a.69.1768509964853;
        Thu, 15 Jan 2026 12:46:04 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c6597sm4658416d6.41.2026.01.15.12.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:46:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/linux-yocto: disable kconfig checking for sbsa-ref and sgi575
Date: Thu, 15 Jan 2026 15:45:56 -0500
Message-Id: <176850995588.1855115.11362774438081683505.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260115145056.3069017-1-ross.burton@arm.com>
References: <20260115145056.3069017-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 20:46:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6850


On Thu, 15 Jan 2026 14:50:56 +0000, Ross Burton wrote:
> The linux-yocto kernel has strict configuration warnings enabled and this
> often causes warning, for example with 6.18.3:
> 
> [INFO]: the following symbols were not found in the active configuration:
>      - CONFIG_SND_SOC_ROCKCHIP
>      - CONFIG_SLIM_QCOM_CTRL
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/linux-yocto: disable kconfig checking for sbsa-ref and sgi575
      commit: 6aef0d46a99a7239caa84d135ca6c3f1bb9f4635

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

