Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5649CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:18:54 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13294.1763396329305384422
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 08:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Q/if1vTw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edb7c8232aso65834731cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1763396328; x=1764001128; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEnxMLW9T8GiYinYtr6LsuLKHvQTcr3zvhYt0wZttD0=;
        b=Q/if1vTwJC1sEjevJ5lTyKstnvamJEUqT9yeAhIcY6jO7+hYpCg2BMEsGIxEfucEA2
         IPcyBzzAH5DNxEvzkXscwVuCizNOGH/eWNvZxtqzgqbYaXc1LkjUfDLp9ZPDcxLxWWaB
         +sFOawDBRgKSMSAgyZpls5xmASmmc+zjIkvvHBnFIpDYsQP8j/b/HYRg2wjqw34gJAuB
         E1FTKs4kwm82+ysl4dek9Z4/PsLE6AS9dgZta+X0omV6O+G9Zjo7G6Xar+lIwaWnOucN
         Cd19k67QRuytY411GFFePaWzhA1gYE7qyXcni2IvYarA7S2xJES8cfTIWDThsqa9rE23
         f/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763396328; x=1764001128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wEnxMLW9T8GiYinYtr6LsuLKHvQTcr3zvhYt0wZttD0=;
        b=SJoB8z0NvnCQSNjGzisfNTTgRnV8iy3yZJfAxFSUIn7eUZ6dKNkgkyP/hCih6DTDUW
         Hbwaosk6V2mf0zTdacnWlvMa0ikclHJfCFw6SnuiYKfUOjVosXNQnGyIfZyerKwwQ9aT
         wZ4pssfNGpzURd//pYb5YHNYbxne1aCsDVjC5x82Ho++yAvvgaipUpgk1z3wgfYipuhV
         FaRuYOudYx7B/t17zxEQJ2ZDKAYchNEitJ7sltocFS2TnOa8GHlGUKEg7vsFo1lrF9Ci
         fTpeKmHw3FIhb/mRoSvzX3VssmAILmYZdJv+zAWJsXqEqj0G5RozoBH5SiSLCaQ2cEuF
         ljwA==
X-Gm-Message-State: AOJu0YzZnBXVFnjwy3GgC5JVI22HkZy1HAIjGGK6OZToevNXlCHboiDp
	5w6AY16o55wBv1P/16RvBK3AnXhXlot4jLq5oP7dqKksF9LelhZxrjaYshFjfpXV+P+6VPmukuB
	OWFk=
X-Gm-Gg: ASbGncv66gKyx+ATpA+rP8tNIT9C3Y7Yt/kJOTj/hXIMR2I148QLyn2IHDhkQ/4COao
	WQJ09T+5jCl9Fyah9E7n2RLXfbTOe+BX/BK1XaoFDSOTS295hdYuusb4Mev5mci43A63eIYcDtk
	iOWGup7VHPnLzUnvpXL4wpEZFAr0oqlTIzE+RM2ztf7i4H/XjQtINMSrARo6CU6YSgCoEsjBdLj
	8Ydo8VXtUGT9vH70dTWFKbRmR2pAZM7PqeYLseRG9nBpUvIs1Wq07S4AgXRbiDORzW2djfvbdys
	+SzlvyB6LkbGws1b/kYDaqBWWO4+p6hJlRfP18MC1VXFSQnWETk82tHk32FPSMZ2fMVai9dUkYm
	SkRyxIbdw6aTMdznuS9YnZDms2gbQLmD/hOCEjiHNhDNW7HRbMCQ880u8O04/xg85Rsx9lIidFf
	ONKg==
X-Google-Smtp-Source: AGHT+IHcMKtxbf+2c+k01kPpS7qEvQYf4rb94fuXLtdz1p+MYbg0CxXkLSdd1FtNfRRHnbppz5aHig==
X-Received: by 2002:a05:622a:1455:b0:4ec:f1b2:a79e with SMTP id d75a77b69052e-4edf204894fmr164578751cf.14.1763396327989;
        Mon, 17 Nov 2025 08:18:47 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aeeb6710sm992459985a.21.2025.11.17.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:18:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-*: use correct mbedtls git URL
Date: Mon, 17 Nov 2025 11:18:36 -0500
Message-Id: <176339631637.3301228.16472100951807311490.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251110175751.1259294-1-ross.burton@arm.com>
References: <20251110175751.1259294-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Nov 2025 16:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6772


On Mon, 10 Nov 2025 17:57:51 +0000, Ross Burton wrote:
> ARMmbed/mbedtls is the old name and redirects to Mbed-TLS/mbedtls, use
> the correct name to avoid the redirection.
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-*: use correct mbedtls git URL
      commit: 2e54d47d10b1f503b7a24f95821b559835ad3d16

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

