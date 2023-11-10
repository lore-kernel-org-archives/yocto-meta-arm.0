Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08718C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 15:05:46 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.29422.1699628742657107000
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 07:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mwVDjSLI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-41cda69486eso13653021cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699628741; x=1700233541; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=724DN6v5uLlPNvQorMrhtwtR0I8ARcpuf+54Uo6U6gQ=;
        b=mwVDjSLIy/uNTn/delrP2BV5OT3KhtyxaWweEzpCB2ZMUT3kGXMtkW3AYD5u3BpaDu
         SPI6cEizhDl6M/WTGaOJXyP3WwE1qVCZjQV4/Q4cH40ZXHX+EgGMZ8oOFSBfAfocKZY7
         24e6RCPeOggZYplqBzWHjVZ5wI2DnkRrITjqk332+kTY522yPfZpND4wm7/LXlrScpIn
         fmDGtfaQwOvRUPDdmZkWQOq8lan3Bnpa/gkTXIDdqbtYK80lMeWKaeuhP//CPbFjUntK
         kb5JFwnVJWr8yAq8PQxvPW437gjaQA7CB/7aZRpYV3RWpqPg04JDS0Ju3jUwf+1cLVXK
         O0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699628741; x=1700233541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=724DN6v5uLlPNvQorMrhtwtR0I8ARcpuf+54Uo6U6gQ=;
        b=hVXnYNV78NwyEiDyOkle/PCXhIGZeOrTuXK8MyBYEc0FbXy8YiZ7bRlcLtbN/bMEQn
         ovad4rLLbC0fQralxNHijvn+GBPcdXZrUJj5a/GhXW23mtfX+G75z8UtnqdCvlczSiGZ
         TVsmhr/6vpappeh70aaqP8+kj0Ku61GW3j/mfUjZ6RD+5fv+bh+eOqdiOEEEabLiZZ0M
         Z1eLJPnFPBciutlpMLCezCbZw23nAh5i/SaFfAHyY0A16f5S5kY3EiWXvKLKNGVYpVP2
         7CtkfFRblu9zQqdir4Ave4iVXWTXf9kv0x5VYBciJPKG96r4g5rOjUQraptsrUhMbjEJ
         b9pQ==
X-Gm-Message-State: AOJu0Yy1XpOtN6v7WRGyxCqkbY4Kw7nzMmxOZTzvitTXklN0WcYX9Jkp
	V0/4v0Vek8qhE5zmwo7rEic2n9imW3QXxBwzHlg=
X-Google-Smtp-Source: AGHT+IGg4tTiKcusCSy5r7o+ucCOCYCuxhcUfootPCCLn4tW5vrcrVlA2vb79QtdfoGw2Ed0Vs9H/Q==
X-Received: by 2002:a05:6214:2464:b0:672:24bd:3e3f with SMTP id im4-20020a056214246400b0067224bd3e3fmr8561779qvb.31.1699628741323;
        Fri, 10 Nov 2023 07:05:41 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f6-20020a0cf7c6000000b0065b151d5d12sm2930408qvo.126.2023.11.10.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 07:05:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mariam.elshakfy@arm.com
Subject: Re: [PATCH] arm-bsp/corstone1000: Remove inappropriate kernel delay patch
Date: Fri, 10 Nov 2023 10:03:17 -0500
Message-Id: <169962859923.2631724.20351221248085346.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231109154827.4103-1-mariam.elshakfy@arm.com>
References: <20231109154827.4103-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 15:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5226


On Thu, 09 Nov 2023 15:48:27 +0000, mariam.elshakfy@arm.com wrote:
> When booting, the tee driver from kernel side
> invokes a yielding call to OP-TEE, which gets
> stuck because OP-TEE never sends Done response:
> OPTEE_FFA_YIELDING_CALL_RETURN_DONE
> This issue was previously resolved by introducing
> an inappropriate patch to the kernel with 1 ms delay
> in ffa_msg_send_direct_req.
> Further investigation proved that OP-TEE doesn't
> get enough processing time and is constantly interrupted
> by the kernel requests. To remove this patch, TF-A logging
> level is lowered to default (40 in debug builds and
> 20 in release builds), which eliminates the time consumed
> previously by TF-A VERBOSE logs (giving OP-TEE more
> processing time).
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: Remove inappropriate kernel delay patch
      commit: eb49bb6ea2315d28d268a15416829f65640ed7a6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

