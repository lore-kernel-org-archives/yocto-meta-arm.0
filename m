Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065BACA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 03:58:33 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.17821.1694491103673171196
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 20:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=YJlw4ATR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76ef8b91a72so319926185a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 20:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694491102; x=1695095902; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3yecHE53T1ksh2hPY8Yzci+KIhVc7sNggP1AdAoRR8=;
        b=YJlw4ATRDb4aobE5f8AP2rWnUaOx4WofGWKwySjOO8T/HbgnJAOzJ/QbsiBZenPM2d
         nFC2o5KCGNFmsKUiv7PNNjJKE1uXb+f+ylm7k4osz/6XN9KGH1mB6jqmRMdLrgKR/NCk
         IhKnuNBbHuZN3W1j79BIMXOfHZhPu2SZX78lM1agm5C3CQ7PpBjEagMHZxNLm8gQsQFr
         rZY1JjUWYYHhocTMo+Sp3QUAOgmoMO6XEQWQZp/jyOHUd9dyrL+Y+BeMdK8WuYChEQfx
         yWqLrT0rPUimu3GPWoe8CmISmYkzf8Aptg9gTkPwNpFhtEHZy8BWwaWXbj4kL1I0PksE
         t7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491102; x=1695095902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3yecHE53T1ksh2hPY8Yzci+KIhVc7sNggP1AdAoRR8=;
        b=j+quOEfCZUz3REZNm3ZQ4zHrKs/oNDCCzlWO/n+YRbdB0lptgr7vfBvaBx2PaPL+pa
         SfB0pvSwG1i/oU3DNTxQa2h3g9lFySVRos99aY74TmOMomwaW3C5Pe3Zs4cw4+QrprJu
         +cPqm9rCJSVG6AhoidtZP6FB6T0xDlbRTs/k7FvWgMCY2FEqGIIz92cLmLyjQYRCIBA8
         hXiXFyJCXhyfA2u1VNnsVhxasv0oOlGik6t1IDZIEhp8hZE65BaSSJHxe85t8sI7GGE2
         87UNq9fI7YZCSql9LA4oXxhFUaSZ//NaGrN21dLYML6JlfpXZYn/scZDxxOY2opscTIr
         76xA==
X-Gm-Message-State: AOJu0YwiehyY1xekVhswKlUmVZbQ6T7PEKcAnRpfcFOjI83hlk/5aeQL
	T/kylIFUQOYlsBylmMe6ZB+h1M+++KtdbpFRcRc=
X-Google-Smtp-Source: AGHT+IGR7dIllvvzABY2SavQyOVDqUv0kB2e/zRl03953qnAX2e+51ql7jpKKlgB11e7Z6gdAJno9w==
X-Received: by 2002:a05:620a:991:b0:76f:839:6bdd with SMTP id x17-20020a05620a099100b0076f08396bddmr11538524qkx.3.1694491102346;
        Mon, 11 Sep 2023 20:58:22 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g12-20020ae9e10c000000b00767dc4c539bsm2958178qkm.44.2023.09.11.20.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 20:58:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Mon, 11 Sep 2023 23:56:37 -0400
Message-Id: <169449099948.3039896.1907453874981122672.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230911181435.54905-1-raj.khem@gmail.com>
References: <20230911181435.54905-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 03:58:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5036


On Mon, 11 Sep 2023 11:14:35 -0700, Khem Raj wrote:
> * oe-core switched to nanbield in:
>   https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6
> 
> 

Applied, thanks!

[1/1] layer.conf: update LAYERSERIES_COMPAT for nanbield
      commit: 2d809a7c3511b9fcb71f1b264184e7840a378adc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

