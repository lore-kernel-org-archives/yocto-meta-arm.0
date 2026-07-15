Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B56EC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 12:47:03 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5184.1784119618048070671
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 05:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=STU+Q9pA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8efb708b1a0so46335726d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jul 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1784119617; x=1784724417; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+b12DpcZxVovNlHXw+jyQp0ZuxNJ9jQgvKrZveoazU=;
        b=STU+Q9pA6qhaI3JdCi6f+H89VJ0gtsKTq/VuPv+cwMOYjw06VHoH+h2WbviNHl7l2Z
         qfUYB2JyXf53/lvNJ5EPXUpiUXbxvVbUkGtvhp/ZWoACcHNRSMSRbb9DFXWf7n/8Vq6k
         ysZpWQmGow48Lc15GtyS561la92goc/VSlW2P8krs4sFKsOWQ0UkXqB/8ZY8F1z1mR0t
         DU+Mb79U3f6QpaO21tCrIoi/Hy+/X3x/KKXl1XcdreDbke7bKRBz5kJcImZnr/8uur37
         hn8H2LHZK67psuuIoJ3O2RP3+6l+MI6j9oNzW4GJOCO3/EgPmso2kV704zC4Mby+xxsy
         if+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119617; x=1784724417;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+b12DpcZxVovNlHXw+jyQp0ZuxNJ9jQgvKrZveoazU=;
        b=Q32CPcYJQnSPVoHn5/dyvqTnAobrpDuvS/MRmmax3HALqjjvstFFgNJuJXpta/ZrRY
         GfVLRotg11A3HjL3xQWQDekRf29isYLKbSA2dS4G+29ssuKrsC9eykgKGnAG2hMUK8Mp
         RDAgHjoibjiv65pzWvRiMiLa4nK2ATPyrrFRl+N9KLgV9h/k9YNMT/RC9YEK/Kisr9rr
         2fEUerDevkXUyaJguYXal2TD+6/wCFjmBNAVDUkYoAWAwaBcvx8j0J5K7aGhPjzn1j3d
         h4OL2bYjpCB1Ejy4N9WarWzpPowFnzCyq7B9triyGQlYkxxsaqGqvIUdOajDQK1Y/HWx
         hczA==
X-Gm-Message-State: AOJu0YzqUA7HZrkSwzmZBCH6a+HsbJxIftNkPGHsk/Vnb/erDKXm/7km
	gBSH8yuRhj9mk0S44N+OZPP0GKc8mISnu+SUjVIPKQ0SvI3GqkBbki9iYhjaD9EnubZfTkskujG
	CAdU=
X-Gm-Gg: AfdE7cnw/7r1p+tsUK2sRi2D/b4bzy193Jf8bvQLUy8m2uCzblBhWx9oOiVls4qDbXe
	0R6veejwrp29NAMbHd3HSa1wDKCKoz8ymZz6RjIcT5V4TglMEAoN/cJVZNrLLwNEKsTZyYIQarV
	YEhPCmaLx+F4WIdP1TiuFvYPF8wAc3ENuzvji4ZoKuLF8Rx2SelTlmAr4xbhDeNKe7YNaZqdhDi
	GXLzGaNDwnRH9p8Sqj9kdSS0ZTHymwGEW9JA335PpvB/IJ6SQiPdjHAEBFlXCoYR1qob3m/S1hq
	5F4XAtqtS5mgLWX25s9vI/qC9CpK4LpyCO1lQvOrDFBTvnVclmycaYralNsRwCRz8UsILvKoM75
	BRM0RoCP7OzT3ySNAcUKwgC7bbMo5g3QUY4hBiotsFX9ng2qbSLwUmg/a1TlWxG2GoqZngeB8os
	Z+OGUGo9t+t0hw
X-Received: by 2002:a05:6214:3986:b0:8fd:81c7:921f with SMTP id 6a1803df08f44-9074c6dea9fmr73366766d6.10.1784119616914;
        Wed, 15 Jul 2026 05:46:56 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b91sm193423626d6.19.2026.07.15.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:46:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: fix sstate-mirror
Date: Wed, 15 Jul 2026 08:46:48 -0400
Message-Id: <178411960794.2115024.3295555385872984280.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260714154450.64006-1-jon.mason@arm.com>
References: <20260714154450.64006-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:47:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7118


On Tue, 14 Jul 2026 11:44:50 -0400, Jon Mason wrote:
> We should be using OE_FRAGMENTS for the upstream sstate mirror, and
> BB_HASHSERVE is in base.yml
> 
> 

Applied, thanks!

[1/1] CI: fix sstate-mirror
      commit: 3e1e5eb2818cb372ce1d43a0bd5c8c382f07d798

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

