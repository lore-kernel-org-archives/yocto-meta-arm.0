Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A545DC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:46:16 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.63.1652719569031481304
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vQgs/5Sz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id w3so12694350qkb.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WecKZbJPaRmzNTYHfkM2UMgoe+doL2J9l+ZNZMAE+AI=;
        b=vQgs/5Sz/szslG6hfu/f1W05Z8EwJBss0JIw/ZJ68yAJqFUQUt8/xjx57F9lfLpjwv
         VkR0swzKJzz9izKjylF9bR/IQO4BixJQj01x1kgM6uCqv61hwQnLasSNDyQzd6KXEAQn
         A5wnOmoKysDGcxOxN9kFEIpK7fEVKEtnxNCWXKdrOWAOIjrmpyAC6d1rN5NBGdQNy4D7
         dEyBumwjTUWH3cq4GQqSs0hxa3mD8zSOUrm5R5jJfgMqsba3GmpbhGb2m0Ge5dvRFu8t
         ohTEttL4CwK3EXr4bcRvU9u3z5jEvWWMfzWEpNWw+JUWoT0HC5fQ0jsiJVSg98aVSwLs
         5jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WecKZbJPaRmzNTYHfkM2UMgoe+doL2J9l+ZNZMAE+AI=;
        b=S7YnZbmiFitXgUmRsfnbPzJgT3KFE0H1uR5szo8Xc3jDtUPeO16rvgig/BI58kubfe
         TpaTIi7SHfhbDvBh5anCwTKcwUFwY4wNZJ+SS6vYbMGh1VAbMxwlPdkHYsW1WmpHLypX
         8xReogXQy9LAYl/tRZlNlUlrs0OYN1JWJZugxHoneYW0kE4zgT86eXoVuIIZ4Q0nHyjE
         K5VKbdN1lsJhsAZq/7ApIqNeQmNls73WSvFmbQJSeNFgCJOVX0W5VEwdCpSZRUel0uHV
         xpkTZCShjjfEB1Ryo5vPObSINZyFwcxYEMudGIj0fSmSW0Vp5dnkmXxWNdsvCt1fFcIX
         +ojA==
X-Gm-Message-State: AOAM532a5LaQmm5IBwFEmryVg+b3hswSg2+qZJzrYl+f1BlZL1Mob4Py
	TkbnenW27Mg/UiXGKS63V52zomABCpz/w91V
X-Google-Smtp-Source: 
 ABdhPJye79HpWFrM7XCS3l4G8loaEaWPUu4N0qbcIQkhrV5VYA1+GcLW8TQffV1OKoKNp0Dem7OIDw==
X-Received: by 2002:a05:620a:2556:b0:680:f727:f4cc with SMTP id
 s22-20020a05620a255600b00680f727f4ccmr13048285qko.235.1652719568029;
        Mon, 16 May 2022 09:46:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a05620a04f100b0069fc13ce212sm5693927qkh.67.2022.05.16.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:46:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] sbsa-acs: Fix build with gcc12
Date: Mon, 16 May 2022 12:45:46 -0400
Message-Id: <165271954728.1467292.2690458714261959596.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513163032.586208-1-raj.khem@gmail.com>
References: <20220513163032.586208-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3410

On Fri, 13 May 2022 09:30:32 -0700, Khem Raj wrote:
> 


Applied, thanks!

[1/1] sbsa-acs: Fix build with gcc12
      commit: 53f1a7544dbf38a8c46e0d2457c1d329feba3c37

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

