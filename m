Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E56C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:04:22 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.27665.1750604660711451756
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 08:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=GciTePBM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3e7503333so524867685a.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750604659; x=1751209459; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP2UHJZya8wssAFKpnDTYCqM5Iy/luNwc2rBhIchv54=;
        b=GciTePBMNuyzwSsVqG74CMW2BNTexA0w64EH+5Ret0YyzCCO20Y6cgywkckY0DVbdZ
         ZAaJkDaydpmN2Y6Ha6RsNuKfTRDj2YOhf6eahkrOnM7zBKtNgmwA8XvCBaUGEMHyK2jt
         I0HaeErxmaYRB8SvgjrUX/wx/n60z6+PBKsdXPYFFzV1xmaeYQwrtGg0qJaZ57NHAvgp
         WTNGVnQd0plUjTne9YE+8P25eaPWYiFmdFpU4Ue5RwCk+A8z4GZl4ZWUvfkAb77eH5AA
         VYmLUxqRiBkMK5CPuwMglrpPbiQfNb0rBgIPKOz0KbUtuhstORsnNQdE9SyTOKyMbTqt
         ukRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604659; x=1751209459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP2UHJZya8wssAFKpnDTYCqM5Iy/luNwc2rBhIchv54=;
        b=lYThbCi0yeyQJr8ygRim5K67iCoimDp8951y5J2SAjzT8d8ZKJ6rZMlccZgRxt1aOd
         SFMgI5WKiAml3HQlLHHHHU5j2XWF7L55cNzofyt4yP5RQcVy1ofhayTUy7Pcd6IkSqjH
         pB8r8Lhnm8l0KrkuuRhHiVJDnlf8WLyC1HiF6QEKD3c8wGMl/h48bp0Kjwo7p1hXG3WY
         kF3PyHsw0FvY0YsLv+YL8oDTnnEsB4hLicCsSDkCCmcVg5eNJJYyH4cEZGzTWI57BKln
         GZRlVo/esBghiRhnvgxOmEwgm28nROwp9911Xe97QZyurLzO1eKZ289wyk6Fz8y2yjPx
         fhww==
X-Gm-Message-State: AOJu0YwREWzwednxHSNdP843ezs61HkBic2azaHtDn8k4ztPNu3Nm22g
	QmnM/sKh+XxmOP0cachDsNqbHcfWVNU+bTwEsa6DS7yq1FNRtz8B/igaTL6+mImRsf8TCrZgUNJ
	XcD0=
X-Gm-Gg: ASbGncufo2/p5BRQok3OzV/yYl26fGeXkyPou1+yz0/YgJJIOzpHE8akKT7jPYJc2SJ
	7klNzB6YYZfHMzXYnEj9R0IsTf1+8gTzueCTRR6tJuHEaQ/Clc64XxyR/mC7jRhim8Box0N7YMv
	FprK1WJbVk3hULRpwJQavrb18qQtH6k8GNcKFpoJjeGDFBEgQ2eA+7aZx7sq4y48pNJoYM3zNtJ
	92PqAodsHgxbo7uompgfV2R2aOgFJDUE4ZKOiIUsiGGhGcDUGlky1raWt0ashtGN7p8yGKA88/i
	i4AT0unQGbdcQvB0dnQC1jNVic1BMGpGkm+znBcy0OiqPQiGbwC0ew==
X-Google-Smtp-Source: AGHT+IHR+VTPySkpey8Q7+EwldlesPOVYKyrFAXlTpPLA1NAjQAHQ8Yy3a1hj8tZai9Os5zauJS7Gg==
X-Received: by 2002:a05:620a:7001:b0:7d3:e939:52a4 with SMTP id af79cd13be357-7d3f98c4a72mr1251730585a.3.1750604659461;
        Sun, 22 Jun 2025 08:04:19 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fbdfasm297704485a.85.2025.06.22.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:04:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update KAS container to 4.7
Date: Sun, 22 Jun 2025 11:03:52 -0400
Message-Id: <175060463220.3865854.13088784929719531133.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616152519.4560-1-jon.mason@arm.com>
References: <20250616152519.4560-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 22 Jun 2025 15:04:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6579


On Mon, 16 Jun 2025 11:25:19 -0400, Jon Mason wrote:
> Bump the KAS container to the latest version
> 
> 

Applied, thanks!

[1/1] CI: update KAS container to 4.7
      commit: f4438fdf7126b7e1045cb43ce541ffc7876b2c0a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

