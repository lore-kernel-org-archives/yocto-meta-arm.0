Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE40C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:49:35 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.13599.1747403368295407669
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 May 2025 06:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=3BVg0tFA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f5373067b3so25456846d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747403367; x=1748008167; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhXZXM6a5Io6EQzguUHWwEwWcm1sNORlB0YM+XY9/p0=;
        b=3BVg0tFAVsWXAb38Y1ryiOSOCa4nQ362v+OuClZZrtAbfcp356c9ePQ0gC5FAtA4ex
         JZdI0LQ/3LNwEudn0+5QgwLm5mo4sPaCfTHVhmjiuoOjhRC4E7jL/Cw3ymnIGapcmwum
         q9Awttz+RVEIkUzABpevGUSWE2mCl8bMkDsW87WTDnUhpFkh+dXQM4Q8TJwejP0k41pP
         ibY1hpbiWljqsNE+X/Z4IQARkSNDLuyWVQiKnQSrVwvnUP4tmsx1u0C97tHkiLx8k9U0
         sLonqsmdRiMUn6lfW+g0ogLZwtD/61k7aNz5xJVG66GsSiLp68dcXqa1gP/7TrId0e3X
         /S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403367; x=1748008167;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhXZXM6a5Io6EQzguUHWwEwWcm1sNORlB0YM+XY9/p0=;
        b=I+JyAC0bO0i8dB4HnLbbfUh2mMlPKGZDe3N1bCNDWgLs6a0uwKvoTs6tqfXjqEIBRS
         LClFwRt/IFqG6MS0wA4UqcU+cTm+QIa2b7bg3SWi/YXRxqAzKev4vQrHdyAn7q/CR1li
         GQryTOGz2COeG0IHVkB/8+BpYrqrV3DwWhhEPkM9Ug7K07iSlm8lFBTlmgSddIAUtjRt
         CQTiFQudX9RiY3efKbODJlO3OZEprkTv7Rx83ewLyLtWboimkW2bxkG036b38pEo/IwR
         q4Plfk1q7t27tgJTtbeayxFTJQ+LLB9bjeSD2bBjOjFhi8L0VyOG1a2+P9suMx42rMkD
         TDkg==
X-Gm-Message-State: AOJu0YxTxvj6ol40kmH+MrLKn+qOYgk4bBYesDOhnjQqHc8IwiO+HeWD
	J3YP1QPEeKx0AUHCKOOLCowFTOlJJCjbw6BbR6Qv9WHR1JHCvuopid8XFAdeJFUl/7pGBsTBjIb
	4NC2lqA==
X-Gm-Gg: ASbGncuPDytGjrQWvKxQXFuUDuAEjhQyafRYMzZKixeF5h10UNkiJlMvz9P+bC4xa1w
	bQTuMo1oraM8yEMafHe/z3NFZyWI7NvCTOKFjBSwwogL5fmdjvXVzYSawt2Gc5xBZgiNGZSdhmz
	RgZIayGp9wdIcD2TCNS+ZwxVSe4oHz16BtZeWwv/YpuHG5mjhWMJE9vWbC7hMDroew7XkQdTuNX
	xq1prP+vzMDOXImOdS4z7ISJnUIFPAX2iyawPmR52fKZ01RlVb72gdiInAtlJceMeoSTh7rbS8q
	/p+01SCHDZASCJM0f9kCqUfgTN97FawXD5+kIR/C5a4=
X-Google-Smtp-Source: AGHT+IHDhipxoHQw/zBiV6CwJOPalJ22D4v3aI/mOUd9YMWUTiuUdHqfkXz3/tQte/xcHs9o4zhAZQ==
X-Received: by 2002:a05:6214:f0c:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f8b2c7b1d5mr45924856d6.21.1747403355708;
        Fri, 16 May 2025 06:49:15 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097a59fsm12153116d6.102.2025.05.16.06.49.15
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 16 May 2025 09:49:15 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm styhead update
Message-ID: <aCdCW6OrojzqduYX@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 13:49:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6503

meta-arm has released an updated styhead support tag, 5.1.1.  The tag 
contains 19 patches from between 16 Oct 2024 and 15 Apr 2025.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 5.1.1) with a yocto-x.y.z tag (i.e., yocto-5.1.1).

Thanks,
Jon

