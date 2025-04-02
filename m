Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4384C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:33:51 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.5356.1743564828272216856
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 20:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=F4wC9DMa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6ecf0e07954so81694596d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743564827; x=1744169627; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTy+L8gbJxqAI4tTqrcdq7/Y7gBohFo60QeNWrO92jk=;
        b=F4wC9DMavmxvMvEZIK8h9u4BaaQS3ONRJYFunFa3pGuFX2ZTvy2cZgzYxRie9WMDj0
         luA/FtdJB9mbF9VpbLPs8k483Ho7bz1EXP7pTsUMwtSgMpoBMcIiJMF/EWqOTmu8WKyW
         wNg4ytZHB8IFS+zrlgPvUjgouu6CdV87p2QfYS5eSmrra4erhM3zt3/PTEPBBjqOPuHe
         7VenBVdXYQNZRq7/fsn90kciE5N0mfkwG/0Jegef6iDYEKc1OsOH+zqY4igHDTJv0zV3
         OqlDvdQh2GgigyXmIDJRh0b9ZabN6HYf3AYUJi8b+kPnRAFVuddY70f3GLZUrCK+D9p8
         JeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564827; x=1744169627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTy+L8gbJxqAI4tTqrcdq7/Y7gBohFo60QeNWrO92jk=;
        b=nYWaxCN+GMPWYXTLM0+IX3V6kjr12giaXpk9ZCD7xRsGfSBf13NLTUkRI1eRAaH4DR
         xDY4hqgzHu591nWJHMS8/l0Lp0CgJL8/nCybd8UZ1DE3uUU76iMvfvFdr96iks9+CYGV
         5ag4+v4n6fOoE3/zs2GIzYrlylmw3MHPgo752g+6167w12bvfEsV68bsdR35Tfvl1/xI
         iP5FOZ+fR0tXapsDTE0a9NehcjJFr9QvFpVvl2uLxI/FHcFMnoxN/FpsUWYSpSLdy9s+
         f6B19GFzXcwH02In1AzZzHqLgb4fgt4j+8aQLIi+FXBJATwA/0Px3MegOkWH2KpUx155
         KgeA==
X-Gm-Message-State: AOJu0Yy+VVCOY++7J9ARthZJqnmfNfVPpqq9mKD7xIiF+lbNAxIXtx93
	JcwwFp7aPIvo6B0FQApDBut0fFKUn/2tKa1sClBA5A+P4pdeBRF3AkLR1/DEB0k9bO1jLUoDpAV
	MUxL6
X-Gm-Gg: ASbGncsOWhC9RrynY+hZDiHwkUXUpPQ6E2KBSAMtMZTIcF7ynhxPkNvryFS+zbumMbA
	AyZljp1jpf4Mofxz4UU5Jog5uLwmWl2y1ALl3JABfcWEo0vO3rsVy8UBxNJol3vEcLEXqM8ssQD
	Ng2yfIRiIC9tG5MX+FloQv7ZmGjm9vFxiH+9gP9C4tSNwWczRR/AFbVmWh4PAs4ZOVlAsMYYhFu
	bdo+yAtR0zAOoAj4ifPgi7dMOY+o0Iv+XaCyFJsJjvfxXpWsI9Nwylj0gispmObLs4pw0AMO8uN
	CZz/5yaD/AaCKN7ZoVz7vymfn2fSapuKM8iy
X-Google-Smtp-Source: AGHT+IG/IL/eH9cGpa+uW70UDV13pN31XvwmEdZT0hbpmQC6CS1kUod3oU0ImE4UpjpwY7iZQd4qBQ==
X-Received: by 2002:a05:6214:e67:b0:6e8:fa33:2965 with SMTP id 6a1803df08f44-6eed5f93113mr251462466d6.14.1743564826944;
        Tue, 01 Apr 2025 20:33:46 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec977193csm69886236d6.77.2025.04.01.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:33:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] CI: use canonical git.yoctoproject.org URLs
Date: Tue,  1 Apr 2025 23:33:18 -0400
Message-Id: <174356479871.2646952.9026264820147196635.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326181206.1287342-1-ross.burton@arm.com>
References: <20250326181206.1287342-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6434


On Wed, 26 Mar 2025 18:12:03 +0000, Ross Burton wrote:
> The canonical repository URLs don't use /git/.
> 
> 

Applied, thanks!

[1/4] CI: use canonical git.yoctoproject.org URLs
      commit: 5d0fcd503baf8278eed4ecc5ee51a37e183bce6a
[2/4] ci: forward the exit code from update-repos
      commit: 69f9b2da1447dbc3fb85075213e195a9647b46ec
[3/4] ci: show KAS_PREMIRRORS in preamble
      commit: 95e4041c19f08d93098ddc998d0ecc8d9df31c38
[4/4] ci/update-repos: always pass the latest URL
      commit: 49cad31d10e6a3d4539c171205254e1ced443e33

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

