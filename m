Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1311DC28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 03:08:37 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.6222.1741835313723826187
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 20:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ymVhbFlm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e1b11859a7so2326106d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 12 Mar 2025 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1741835312; x=1742440112; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E94iYANJjv+Clg7T6ksFyNl4rsukN2uPHSRvwAJNooo=;
        b=ymVhbFlmRR3VGuBJ/7P8i7E+umFH8EhZ63L25lQLqnYoIdvGat60Ov/wC0+EzRmG3B
         ulNQz3TrdjD3vhUH19l9by9a0K2sPH9QzoUIzNjP1pvc/LiQh6N7xP994RdOweKdOcT5
         Wikm5yyGfvWhvmpUDTsSH1U5gILG9zN0zKYfFQWG1JG1Ty7ovzJnxXPUamcjBQiYoGO6
         BwcwZTrB67RuNfjnSve3vK7a/mzxL1iV43mGdjmqYe6LorwUL7TVMO/QWKpx+QNusSna
         b01KpU1OhaX1i7d8Son4K+PnfHnuNIZa4uB9cAXuaepE1hJqIoBjEKxUKuEhnBDx+APe
         FgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741835312; x=1742440112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E94iYANJjv+Clg7T6ksFyNl4rsukN2uPHSRvwAJNooo=;
        b=kaC6jalSD9M+Slj5qxn1UUe9KAs6J4YJ3pon6/OHxtSPiPEEcIIy1n8ezpnUHD0f3N
         EL3NHhlcMBaO4ABcpydzplQCYHAJKZnvdXqBvw70Wg5oVJZ+L8R7mr8MmYw8sHDIoFOJ
         VuY98ObRyWOsqpf719JErYwEQZqykIWqS377Hb63a7RK7zETpFMY2mXFjF0brCAAZC+R
         7lA0bg7r7Yks6GO2J34lRN4zDrAz9snE4NM3DT72Gjt3ZblOS8v/XygbDbBQ3iUR7050
         a3js0Y9QajlivjY62oSsiVtDseg/YPydIVxdRchuPTYQc93CE+lpZL9d/4OPqcKM+N2r
         usqg==
X-Gm-Message-State: AOJu0YxDT/GLqPuqBdckgq7OsFULVMZJgqWKeei5gbgEqdIA+Vfb3bef
	Tv9wjOUtk0OigU2NlTCgnpMFfTlijy+iiJOpSLqUxDWZvo2YsxqkGp5IpP3+EzFYDc6fNOBB91A
	=
X-Gm-Gg: ASbGncvE1BXv1oEriyhdtKVj3toIBHsA7QW1XNrBbo3HKxA1ISAfREO61WEUqcplGB9
	0iK6y22gFTuBIn2nfZKDUWs7y5kpRo2nQBUXMmH+SyJPfXlJSqcYe6c7tLAwiDTJ0LF+n7C95T4
	2B91VoaI3kjiN/ryMbEeYKOPMcdbWYMlvzu+ZKrVcCorDQS9eYYvwA8UXp/pLF3v3+JyTnCg8Wv
	I+lUmNLxX2pZAFyGXSU5nndoFFwkIZYhzFxZhL2NPuPRnC8zQ79K2SgSSeEinO+Qgu4taMFyDZd
	b7ojaJWPHGQpHDgK7j2WhBgVZPdbfaKR5aer
X-Google-Smtp-Source: AGHT+IHKlYlDGi1DVidP/ppc3zTX4mHhtNY1vkpYLqgBr7XQrnbRUnbTMiWPI8kIP5dt3jrZEHdiuQ==
X-Received: by 2002:a05:6214:528a:b0:6e8:fa72:be51 with SMTP id 6a1803df08f44-6e90064da7cmr354684776d6.19.1741835312492;
        Wed, 12 Mar 2025 20:08:32 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade24b8c2sm3837376d6.50.2025.03.12.20.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 20:08:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm/arm-bsp/trusted-firmware-a: use main branch when fetching mbedtls
Date: Wed, 12 Mar 2025 23:07:52 -0400
Message-Id: <174183527228.103405.2632673292040550547.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310120948.1807735-1-ross.burton@arm.com>
References: <20250310120948.1807735-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Mar 2025 03:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6404


On Mon, 10 Mar 2025 12:09:47 +0000, Ross Burton wrote:
> mbedtls pushes to both master and main, but main is preferred.
> 
> 

Applied, thanks!

[1/2] arm/arm-bsp/trusted-firmware-a: use main branch when fetching mbedtls
      commit: af9375798f4431a3a90a62978a7e9e18d2ad774b
[2/2] CI: there's no need to run pending-updates on x86 machines
      commit: e02a77c0552373a9e91377fbd8b14230fce57759

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

