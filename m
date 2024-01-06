Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC0C3DA6E
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 00:46:39 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.39957.1704501990612229691
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 16:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=AqP0Xd8v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783100a2f62so11630685a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704501989; x=1705106789; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko9gBbeGNBW4Xl/srn432GbV4lgbtzbsdLulw5yse8g=;
        b=AqP0Xd8vQFj7iunibChRRtqJoq52zeicvLBr/kt9xCavkNAApkQ7uADWGY3jw/eOr0
         KCWK+1fMb9GXjZ7ZECGeveCZUoJhIO000cw2ZexiUwx5qAM+qhssImdHiXqwDXo9HT7H
         ErZxpHGn4gPrxx29ld/EzlpgwLhbWbQEZI9P/CYLh2rvha9pMwinxbHgGlRhrb7fFKvU
         Q+n0xMLV9UhNdrTduQzbRknHT4ImNMZdUgKdx9ftwkPQPp0Gsv2VhoUYyF6uCthhRPJQ
         usJmyElRRpoaegDNCchMcGMxFuAVbTtOJLzezU5G2eTjOBcQx/EJ5XzZRZN5kMiHWA0t
         tg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704501989; x=1705106789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko9gBbeGNBW4Xl/srn432GbV4lgbtzbsdLulw5yse8g=;
        b=D+kgyyyNm7k6ZzQAMpr2zS62AH2tZm2PRq5S58iSN5E2uXfmGBEvPLirSGTjdnrxme
         t9DiS5/rcbnky3zEb39mNIUw//jVAP3mIUUlUUoO97G2H77JwVFCB40H60dA8ku1ONww
         O2g5i1u+VIrGpZJs2clvL+XEyJW/Hb3KU6qdADw+sfXuvkpOlQae9JGPxUvXmwaYUoaB
         QbRkW9SwSi9GMdPIbtbh/ncj/Ljl0hQXMavj9OPSmnk98WS+ZKQwNF1HMlvufB4PdxFg
         beYseilziTjI/oupCwyXvF+quGx2OhI6PfuasA0JIYA8lneCV04UK2OI47VYoPouRpvU
         4E7w==
X-Gm-Message-State: AOJu0YxxN0gwwjsAfn9+kQYufXimG+13OZxy6G+gxWAomA5A4kacyuUG
	z+Uh+lqQKhi/Ed1Gm3uttfMxsET4QMngMeEyF+tNPpuXxg==
X-Google-Smtp-Source: AGHT+IHwsviUHheQcAMOU7P1gaCMVDhX0K36rNYCHWuhGsImyiBvDJyDmKh5m72zfGkcUWz7V1Q/Tg==
X-Received: by 2002:a05:620a:13ca:b0:783:63f:3f87 with SMTP id g10-20020a05620a13ca00b00783063f3f87mr248291qkl.82.1704501988799;
        Fri, 05 Jan 2024 16:46:28 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v20-20020a05620a0f1400b00781a08e1d90sm981768qkl.17.2024.01.05.16.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 16:46:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm: modify patches to have email headers and correct date fields
Date: Fri,  5 Jan 2024 19:45:59 -0500
Message-Id: <170450196047.2446090.11843875574634552304.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240104204202.26953-1-jon.mason@arm.com>
References: <20240104204202.26953-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 06 Jan 2024 00:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5316


On Thu, 04 Jan 2024 14:42:02 -0600, Jon Mason wrote:
> Scripts processing data for the patch ages need correct information in
> the relevant fields to determine the age.  Create/correct this
> information where missing/incorrect.
> 
> 

Applied, thanks!

[1/1] arm: modify patches to have email headers and correct date fields
      commit: 6de882ae93da7c17562c0a59bec9002a048cad3e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

