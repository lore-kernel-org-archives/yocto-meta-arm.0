Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A177C04A6A
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 23:21:36 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.56450.1691796089057858912
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 16:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=t660mXnj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-76c4890a220so190395585a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 16:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1691796087; x=1692400887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL+jIev9SlLU+UOjg9AOd+lZnVYilUyPc1xgJ3gWsjQ=;
        b=t660mXnjEVl0ZVymIy6beQc4TV7IZiEToMZmmMEQa0dRBtXeNoe/ekMJMnUE5HR/XA
         +yG7YEo+QpVQgbVjZnMp2XfkxpjcdOGXoc5adEB9wSNF1g6CPknUkZA5dlHOf4UN0HAx
         oQyuJ9t0hPkrc9iDdxjMYiG55mOl42jlb9B7z+PaIUD+PFyLCONDI2IPLdANrvL6eXQZ
         z1fe+9PH0lJbw2DOH4x/XhglYYS/toUsrAGfkmOuD39XGvu5bItLJtRXMpRYr3+05UJF
         6wygpkA8afuyTsdYgMUZcV1dWiHKeKtGmT9QBmNrfvDewGK2Cscnzpcz5LSOKKjA3B9L
         lWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796087; x=1692400887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL+jIev9SlLU+UOjg9AOd+lZnVYilUyPc1xgJ3gWsjQ=;
        b=N4LfAfFH7N7M/L2vvCPyMxUjZb8FII0a38ECrONfXsWAtWoDwCcihU2greZWap2GSM
         cX5Nen5vlWIpf2zs60pxLuTwiAmmWOl8/DT2WmZLHCaig2Kd8G+9ldkHVU3J2ee/6hsn
         V/fAunVqIs35Zl8tN3Kq2Cv/oXPkJaceUew8HUKWcyyOiETi4rvlOM8FwZ2q5HWIKTUV
         ZYnoDLxiHi8OeXa6xsrPNQ1IqLBPtagixmjCEpg0sWTej3BNKOwqkZCI773qiykEks8u
         TvEoRBKfHyDAQiSfTfHpahAuHchFm6WZX7Dw8Nmp3qPBfQ/mkwBOypfDX4Qxhso7ukLm
         0sRg==
X-Gm-Message-State: AOJu0YyuLxZZafqs7clj/xNYMPtzybjBYnci5/3RNUThiICEtYoQK6js
	OPJFAQEqgz7dRkhNYKEiaSxwpDCibeZ+q68g+MU=
X-Google-Smtp-Source: AGHT+IFplEsuB+5VQ2PVqYkJq8FksH0DAnNPPr29Y/Up0JOVmMaycmMHph3AvKLrWoR1mbk6SmZobQ==
X-Received: by 2002:a05:620a:f13:b0:76a:eee2:cd09 with SMTP id v19-20020a05620a0f1300b0076aeee2cd09mr3743242qkl.9.1691796087625;
        Fri, 11 Aug 2023 16:21:27 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i4-20020a0cf384000000b006300722883fsm1555006qvk.33.2023.08.11.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:21:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] kas/: pass through DISPLAY from environment
Date: Fri, 11 Aug 2023 19:20:46 -0400
Message-Id: <169179604655.759796.7079195015672248242.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230809092418.2918762-1-ross.burton@arm.com>
References: <20230809092418.2918762-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 23:21:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4955


On Wed, 09 Aug 2023 10:24:18 +0100, ross.burton@arm.com wrote:
> If a user does eg "kas shell kas/corstone1000-base.yml" and then calls
> runfvp, the spawned xterms don't have a valid DISPLAY set.
> 
> Add DISPLAY to the preserved environment variables and DISPLAY will be
> passed into the shell, and the xterms will start correctly.
> 
> 
> [...]

Applied, thanks!

[1/1] kas/: pass through DISPLAY from environment
      commit: a209895b94029e067ccd8359e25279fb35a2c52c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

