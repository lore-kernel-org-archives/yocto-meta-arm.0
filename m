Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8A3E6780B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:12:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84435.1766423563010654845
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 09:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hMHl7lDT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8bb6a27d390so254449385a.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 09:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1766423562; x=1767028362; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csA+KRx/lpLAtRIhRWC6OTGriNwMGrnnF6FURALvS4k=;
        b=hMHl7lDTns6ueyUB3vNV/eZIxcP2xi4oc1tm08h1NQbp75dO24TSYhCTRudk59A87a
         1xCyGMdwW3FWGzgBipl1JrR1CMAk1AKfldEWQ9ZHYhmVP10hsRmTdJANlWj+JY4tToBk
         UJZRTd/Vb8tIuBUGym4Gles1TAak54WZmJGqdDegs310rG9iAgdU75y9ecCqFv59Lc5R
         edDPPU+deIMhV8L9FxmXS/hk0XvzRsCukqPc6wAlKyhb8GEp6FeaUzXBSGJAgmBbIUcR
         +CujVDW9HXHihvkEuCf9atIHXSeWNFt7Zd2QMO/QMoWgP4mppCBw+hpwmY6Aq3+aXgKh
         lPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423562; x=1767028362;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csA+KRx/lpLAtRIhRWC6OTGriNwMGrnnF6FURALvS4k=;
        b=IkUoVG+Qt5Ran3VE+fUsT8kio/ctLExxnicStCQffRvJe6/Eah9mHj2qZeadwS3CpS
         qq7u2r9T5z4kVP/Eg71AF9qx+vSi7cF3Kv875NZuHwbUcG15Di/k7wkqfyUd3r5gT8BU
         XslvOtXNa7wL5TQeMecvLVo39ecHhHVpFt019/XC5+W6GX2vHs3WLPlFRKFxzxt3QWj0
         Iq228qMPFKEfuQ4wQlfj48e5yM6i/T1dTY7szYXg8CVX430q1GazPLmNeZCHztohAuYe
         rwSLvtycGTNu0HTQ/4FcXc4Dq0BRYrmWTavwze1QBoXc/9bHv+pJqk8KRvGVye+oQMd7
         ow+w==
X-Gm-Message-State: AOJu0YydJsorvCW+qQni2ARBaGCOdQEJZ9nWlhRW09lcCheLl4ypO0Ew
	MuS/7d1ZFCPhDAMwceaE6/uSkHsf7EbTEARcExje7TBtAnIG+2j8GhTPs9+zGnOtlrKHghGdjSI
	mAv4=
X-Gm-Gg: AY/fxX6aL6makWbIT8DvZemcbGGx+7+vTeGUt6qe/XkKzvPSSq6WRDEWsGLOy9u8/Wk
	rdbJGITHs129B6pEs5XF4k1w6sK93mt6gXo4EfXcUnMFNbDUOoFdpg6PYDkVY35bsQxbU6yL0cd
	e388/L2sxiES9/aCjuM+e41YNHb8DC0Uh6oNqWDItFMkY/iuZH3lP88vpD431AqRCHa+r+4c/7X
	P0VA5mgGrn7sU220jNhTQXEz+5gYMObMnfoeUEZttkPNlPMCelD8UfLE2QVjpA9jyhwz2U1YUR0
	Nfioip+hAQcsXupQnDUmTNnV8uLFBw49EwLkGiEPAaH19wIZDVYKjZWDcal5jRusmNSc5bkxSSP
	ycZeGVf9X+GpoaLpmY3lVT6NoRRpNdfA8fBaKpnlYE4Oe7yMlidClAXqXJNURCSvs1Jt4Z/2XXw
	Q4Xw==
X-Google-Smtp-Source: AGHT+IH7okiOwwmspnNvVlvOz4IgoI0UhAOPG8P3Fjvb802T1qTn0mWCN+ypnc/0exdump4BoSN18A==
X-Received: by 2002:a05:620a:45a0:b0:811:f742:c752 with SMTP id af79cd13be357-8c08fbf0f09mr1797108685a.36.1766423561675;
        Mon, 22 Dec 2025 09:12:41 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ee011sm872148685a.38.2025.12.22.09.12.41
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:12:41 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 22 Dec 2025 12:12:40 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm walnascar update
Message-ID: <aUl8CCDJL_J7eLfE@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 17:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6812

meta-arm has released an updated walnascar support tag, 5.2.1.  The tag 
contains 8 patches from between 16 Jun 2025 and 04 Nov 2025.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 5.2.1) with a yocto-x.y.z tag (i.e., yocto-5.2.1).

Thanks,
Jon

