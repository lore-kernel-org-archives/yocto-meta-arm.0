Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D90C83F09
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 03:36:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.5076.1752118585425289613
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 20:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lnQ+JyHo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d9eac11358so58444785a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Jul 2025 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1752118584; x=1752723384; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cx3Ovd2jHCpCHC/uXslL9TgFfhrtoDMiDhLSIFFIPAk=;
        b=lnQ+JyHo1L3NyrRENUCX27ud4B1W3WQTMosDa4bPhlApusbu1OrdIkddlejrzxzOxL
         +KOnbFs46mKZPb2AhAHmEmWWpMgI6VHF7CS59rClasSw/EmlZbZQZA/OHaIfnBebKbWj
         3Bkt09YokELURVIW/AetvN54rq+8Rwg0Y6s4KcWqRSYbcXLRtwUSY4Y+HWAY5bN6LhK5
         Ya3uTgAoaGxudlM9DXys5DrI3/8fcoaCZxUPrzSZDMlgSPFs95bmDI0EWLK4iFHJ2dof
         vill3LFypJTWY/ml9amZHTVBArGiB2utZooIVvoNl0g4rLYw2Vy2XyGXOO/7vimuZNGW
         VYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752118584; x=1752723384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx3Ovd2jHCpCHC/uXslL9TgFfhrtoDMiDhLSIFFIPAk=;
        b=AjuHAOFQ685UefE+RVhwmP3NKfRP7MJOAtpWW3HEhRdK5SWrCPpXo+CiBX3PFGLPxj
         h/5s6NUy5l9TdlksR8LmMg/ki+Xj/kbnX28fdDaPow5fyvSMmsYSMDNzTji2yOFkRuDs
         ar6N9WHiOjXN07kdbAPNmHu5MCVFciH1Crvy7yMG6mOqnR8tj7R5YP7dECsk4XYcWJX1
         1OQBMvh5F2hAvLR4zO7nZPWfSu6B9noiZutCxHnUlgnKSArgjSW/n6HMAs0cc4a9aw/7
         I40q85dWXZN39bmWVieHvXELgUvVBX0EzncZvQzCzqt2k5WlaouFYJw8MdKs1GfWpemE
         y0hw==
X-Gm-Message-State: AOJu0Ywh6mVK3oqK4NqU4qzCq72RggTsv68HecwO4ErYAEClCSJd0ZId
	iele6Och0wk/jauZ9BQVB7HTYViYIK7ycImsGo5g+D7bQGkGMlCl0iy9JAk7x0ucxE1DwsRcK6c
	KjSA=
X-Gm-Gg: ASbGnctDml7bsHPM016fkVSu6SnoCH6H9PCNLzclJRn8CoFFQo2sGCk93VnrIDe8mC7
	TGXPopm1oYatrB1I3oL+vrvHrXunp0nlRWyB90lbEY6HYme4VcKolnqXOsw+L+zA8/IYJccnj7z
	MxTrvWqPgfPfLKC1tFd0idqpq3devC6Y8GBVzYKXKqkOAmoWnUQ3tGASZ7aMW2BBPVNpy6j/hVO
	ajS9W86gl7fHXtBMieXgUUCUhGld4rqN3Y+tM4JrKyYktW/NJeTE0LnqG9boIOj3LXKCNdQc9TI
	GImEYINVFQhOBPicfzrNPX0K7E3Gbr7ugTh5teCPHAm60vA6CxtvLQ==
X-Google-Smtp-Source: AGHT+IFjqd5mSmz+Vbw4ZfABM0wHLgUWSjBrWuAERxW5W9bwWHBYyMMZasPAcTr162TBweRoZqqo7g==
X-Received: by 2002:a05:620a:3902:b0:7d5:f350:e533 with SMTP id af79cd13be357-7db7d0ad220mr651308285a.29.1752118584052;
        Wed, 09 Jul 2025 20:36:24 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdbb1dcbcsm46489185a.12.2025.07.09.20.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 20:36:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-systemready/ir-acs: Update URL
Date: Wed,  9 Jul 2025 23:36:16 -0400
Message-Id: <175211857614.385560.4506422828029656518.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250708135504.78280-1-ross.burton@arm.com>
References: <20250708135504.78280-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Jul 2025 03:36:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6605


On Tue, 08 Jul 2025 14:55:04 +0100, Ross Burton wrote:
> The github URL where the image was located has gone away on the master
> branch.  Update the URL to point to the legacy branch, which should stay
> around (according to the documentation).
> 
> 

Applied, thanks!

[1/1] arm-systemready/ir-acs: Update URL
      commit: ed9d996aa9aab027a9c4565ecce92bd16016a683

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

