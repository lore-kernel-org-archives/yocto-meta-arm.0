Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F938C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 12:57:40 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.72368.1718974652162204515
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 05:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PdHYpK/s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.181, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so1782446276.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718974650; x=1719579450; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hpxZUtKf/9iUsSZuuUy2xYqo62nhv0QN6BCofoFvcI=;
        b=PdHYpK/sdHpvL7SG//XIZpOHVXVw3GkP0+SMER7gDRSywFmqXVaPeauqTyxF8YXtxy
         KQKQeA9/qSOxz5fxQl1VTqWt8r7mFbmJv88Dr1I1Z3R9CZBNZEQd2+li4VYdTdTdcO89
         4ZROPswkJhXWmigf2HThh+fpgzfxMwc6w4m/YFTlKh1Nvz4wYfksqReLpoJyNQPYdl9u
         1SGFtIuJ3Qs+k7Fi9E+ba7w05pAxOBxfVLlpbKXqtFQxwtUAGp4JesAnLwIaN6hu9CV2
         tklohs3j/uh52N8HjobD4QtX7Fm5QJJLtNZNhKU8zGCS8UZ2pgGqnyGJ/JqZluCVT69/
         wPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974650; x=1719579450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hpxZUtKf/9iUsSZuuUy2xYqo62nhv0QN6BCofoFvcI=;
        b=SU2bVnopTxgFiIxlQ433Ya+A/Nn9PLGVyrUIZ8bbdzUahg5UHUZpej40QI6kAEfMSj
         Ec1wEFGTRlTXVwAnzc94zUbkC/+pqfOKGLN5eGdaijn6ShEByG79uzB6NbiWpLcEKlaq
         hsePbq9eTemkJPJQ3d88c7M+LFUBgIBpkax/n7h3uyvZwbU/L8mSy95uAGVqbYhR5KvZ
         u+5pMGpiXNrQ3lQEyDCYM5xg/RpVw53cqGnkAn77pQrs3V5mkdA15Io52njIt7WnRt7B
         SkYxkGtq7T3dl6hbRjz1VnfhkzvsHUklFjtanHF8Qz8aWvJwK5im7V96tSvOlKAfm+4I
         UCig==
X-Gm-Message-State: AOJu0YxWaXeCVjrykUvPGMX/SvLgEXCvmKTUln9zvCP5mmvHr34L+4EU
	q0uFse54PDbHwwEal6HoWsowTN0abn/5NjfX4VveA+g6Ix/LQMYS2CX5ex64r7KpZGAElWizb4A
	=
X-Google-Smtp-Source: AGHT+IEoVfPsx3TpwUQ/UBk35e1B9ywRGLTBL9hsg0elZT9xn2BPoa4uwaiXuyOuyet9ogu4k18mTg==
X-Received: by 2002:a5b:70a:0:b0:dff:13c4:abc8 with SMTP id 3f1490d57ef6-e02be22f259mr8199426276.60.1718974650118;
        Fri, 21 Jun 2024 05:57:30 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e62652eesm371154276.34.2024.06.21.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:57:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: update version to 11.26.11
Date: Fri, 21 Jun 2024 08:57:25 -0400
Message-Id: <171897464585.4086829.15608122846352195721.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240619205650.22335-1-jon.mason@arm.com>
References: <20240619205650.22335-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jun 2024 12:57:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5840


On Wed, 19 Jun 2024 16:56:50 -0400, Jon Mason wrote:
> Update to the latest version of fvp-base-a-aem.  The licence files
> changed with an addition of language to add 'Arm License Management
> Utilities', but still is licensed under the Arm Proprietary license (and
> still requires the EULA to be acknowledged).
> 
> 

Applied, thanks!

[1/1] arm-bsp/fvp-base: update version to 11.26.11
      commit: 794262c783e2a644598f13f4afcc9ede3c9f32f3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

