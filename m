Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D551ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 13:41:24 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.53240.1725889280188051145
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 06:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=E8rO5/wh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a9aa913442so110463585a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725889279; x=1726494079; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhUay7KRkyWyQlQoUwnHOR7jv3FkIFl796wZuygRQaI=;
        b=E8rO5/wh/AvMFBuPXXbIDRHJmEG5+D7CgK/e65aF15l/jFbBWboismI3aAbaNRLRaX
         lkbz/GxswKWX/HuIibrwBp2BtARaLqieevcxW/Ps3yapsgj+YcJlVuNrn2uDfzLtJKzE
         8xJSfL3FlrRq+SxvZ+WlN+gOWEuCzv9rCrAKUbmKBHDzRQwKCVdCmnhp3iJV4V1R/1kl
         s5wnRpwdA/hsndRRcjRdKB+1bUDaLOWGW+I/6P1ygchCW4RzjL4PJ9Ho0ZqQKzwsR8ks
         kqOKKiVeC6kJ1mKfRHrgd5POoRb6zRUrXbl/hPuu5Uf2kBXuPsYoUc/jK9HSMmCYlZ/q
         AG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889279; x=1726494079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhUay7KRkyWyQlQoUwnHOR7jv3FkIFl796wZuygRQaI=;
        b=laXrDl7G5khthqNOuDR8M1IA3nWloCBLYUL/LnfiF5Ed7s+8y4Gzy+ot07KoYHQhd+
         PhmJhVxiOgL+/lCR/o6MMYyxtms0WM2LuP4XfPyyzaLWtRl6bLUlwiT564bKdUTuC8SW
         vbmkaFRzSyJ2S5FfxfZzGKRIGJjH/X/KH4RrGHkzNYZjS5bNnuDBoqYVYp4trnTJwhwQ
         BTSzMDtv1QQuwuIYFhyYl1iJPGtb8O4p5O3IIMjmb3gQZC9rIQOXHBXOzd8ObZtafeYA
         2buo2zkSP/Clu9S1Tawu9L4kZaGM1qQYVVVELShmp/vmHRJtijHqYiAZK/EesmJbEp/b
         7sLw==
X-Gm-Message-State: AOJu0YywyWERMoMtBJGGc2eihkdxnJJrF7fjLZ6G6R3Z2t2pHUgdrf+1
	Hf5ZMAQDIbQuZcc3yZE45myfsON2fMbz53FpsJLJX7ljXMbH/CfDpIRqr9mlv4GtJH7+OPJsaN4
	=
X-Google-Smtp-Source: AGHT+IEEnNrRx/EiP0clkJ0BIhFq70RrB3Wxq0USxepgEU6uY7+BgrLLqHLYEz4kYvwiKK/5g8Qv2g==
X-Received: by 2002:a05:620a:288d:b0:7a1:da5e:c4c8 with SMTP id af79cd13be357-7a9973609afmr1126354085a.40.1725889278975;
        Mon, 09 Sep 2024 06:41:18 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7967499sm219396785a.28.2024.09.09.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:41:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Mention PMOD module as prerequisite
Date: Mon,  9 Sep 2024 09:41:09 -0400
Message-Id: <172588927045.3341816.9291972461407879633.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904084031.2032187-1-hugues.kambampiana@arm.com>
References: <20240904084031.2032187-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 13:41:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6068


On Wed, 04 Sep 2024 09:40:31 +0100, Hugues KAMBA MPIANA wrote:
> Add a warning in the Corstone-1000 documentation to indicate to the
> end user that a 32 MB QSPI flash PMOD module is required to run
> the Corstone-1000 software stack on MPS3-FPGA with the AN550 Application
> note programmed.
> 
> 

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Mention PMOD module as prerequisite
      commit: f975faf4c3ab479b4feb1dde42d6fce354b1a306

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

