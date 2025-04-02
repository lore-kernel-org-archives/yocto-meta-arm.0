Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4A2C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:33:41 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.5353.1743564817957254875
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 20:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rQAas/zf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7c5aecec8f3so975111785a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743564817; x=1744169617; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3zh6kBrcuzGbY76gOEK2DUap3euJKUBz8m6lDV8cmg=;
        b=rQAas/zfhI5FA1c6nFdHjMwLg/3loHIB6VFDiNtyW2ojMVpLSaXw4b1ChfU9WpWMyY
         9rHquuOi3lt+g6BXpr/Y5QT1VMuMDyEsSf/tc+iMhn9Yij3wLeKORputK5+JUJEg0EMH
         RGCh9oS2ydi2K5DuxApZR3X6+avLk9sP1flN9R5+joMKVTw1XeOiR2woiKG//TxV3qSL
         wWkcK1LArKvN7Lnds23jlnkPwcw5Xhrwsqn0f+FRhkL+0YI8shxwFtUlXaDgyQKkBcay
         gtracM+bJaV0e5yd+CeDeJCmWV+V11Tc8dfIpkt/7MhGKMjFIKq4DBu1vCbvPNwN5cTm
         AZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564817; x=1744169617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3zh6kBrcuzGbY76gOEK2DUap3euJKUBz8m6lDV8cmg=;
        b=FhWHWQdNBmFSC9pb+UkJ+y5X6cqGp+XhSFj7Neu/E5ELZekSqZJJtVdvy68pUIfI9c
         hTRaVBhJt7fBdqyEpCkUktyKfHF6A796nQlZtJPAqZpP7G0kdwCQ6Mgf7Eto/YYdIkHa
         2wiRQklh4Mf/g3/OdwUmYnaxh2aDFTNfK6fHr9QYEbv+073xDWIsL21Fb17BbIlbv10F
         DYTTfpiXWGhSPO/HdedaPnddeGZPKjqoYqQDQBedm9tYMyg7AqyaCBYSvFrBZF58c/RR
         A8Bx55YhwzVtCwHqoWgMMeSwxq8Qw9PA5Xpbp0CCUHovrtQcfBIE/dwWeugF18n2wI3k
         Ieaw==
X-Gm-Message-State: AOJu0Yw1ld3f5yddp6LPSA6ObAFNw3RcJEjFX1/IQywS35q8+mElwqM6
	Gz21CDGQiLZ3qW0FrH60thLf5iBZz+lOxm1AibfG+g4OMG+pKuveMq45YtCsVoAczSa6c8vzxFR
	XhC43
X-Gm-Gg: ASbGnctsTCwsbG82CRoUp3LH9p7jtDfW5Fz8OnesHmP8XGKBkpS4E0PWmL5nQG7H8Tn
	PQ0zXBxpmDP5exRIsHgjhJVqHhh6qllh3EzgQXeX0bFlfTPLmYJGDdfHl5xeIbcZo8hSee+GUgu
	r+LgowHJiPVuOWVQGVzEI0pekMCIO/DOILGBzlYqgkn7VFijDkYsal1i1Cl1iU0bj+fwgCsuvjC
	wlzjIk6C/ZJ2mdhV99tOMwEIQR/0D2qHEv5yoFimMWDts7Lzgm2vj3KOAbvCnta/2EItXoRVxwd
	At2JpO6r+hI32B+61acWskLqf4tErcAHhYLB
X-Google-Smtp-Source: AGHT+IFVeRPRAe8Z7EkjCQHxZ48ynWDsXk87qphcRxZFTqoQ8rkGn5b7ZcQPP8WjFUkxqMxao+A3gg==
X-Received: by 2002:a05:620a:c51:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7c68c17ab4bmr1848031585a.14.1743564816776;
        Tue, 01 Apr 2025 20:33:36 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f768503bsm741754785a.37.2025.04.01.20.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:33:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH] trusted-firmare-a: update qemu patch status
Date: Tue,  1 Apr 2025 23:33:15 -0400
Message-Id: <174356479871.2646952.6797725730122808740.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401083459.95056-1-mikko.rapeli@linaro.org>
References: <20250401083459.95056-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 03:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6431


On Tue, 01 Apr 2025 11:34:59 +0300, Mikko Rapeli wrote:
> Submitted to upstream and worked through review
> comments and CI issues:
> 
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/36514
> 
> 

Applied, thanks!

[1/1] trusted-firmare-a: update qemu patch status
      commit: 9f19b9b9a33a5b6fa7e4b0806b48979a86e80753

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

