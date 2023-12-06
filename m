Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448F6C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:19:18 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.32720.1701872354053143132
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Z4gwJuAx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-77f2dc3a9bcso30801985a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1701872353; x=1702477153; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veKx2B4j1yZIAyAzJBVcmEng6SS6vrnk6fxuxqGJ7R4=;
        b=Z4gwJuAxE4bmPqN+qpV2ReFYC4tffZIhEJycDxul8MD906kifrOO1nR0SSIOKtqFP/
         zZnJU+dXr+x6a24Xckb2ZQ1Wd1JMOK1FJZBRYM+67ghJ3DudU8Pnj657MecA4gCqHexk
         2+Wpvp2+gXr82vsdmnId6g/+kNqK1fzbX0peqABhyGGBDVCH4r8COjDYeEEl3G6c2vFk
         Ne6wwcH1M/Ys1rIha+zdtftj62t8h6lyKD3FVFF4Oese4jEZGX+lxLIq/kDEPQcsMqix
         sqxDfzxURVq1c0kl+HY/ceSU5ummXpWH554yPGUg7VcS1Wie8E1+sfIF/V0fH8uvQjzN
         iS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872353; x=1702477153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veKx2B4j1yZIAyAzJBVcmEng6SS6vrnk6fxuxqGJ7R4=;
        b=uEGZ2hXUzpZciWXRLg7xSDUwATalHo0f6LD7ULdIzucukEZO1FAbVy1sFJ7FNc5FJS
         U8S2ku4ikM+tvvTz0yAvfvHWOXWs0l1tKvDWZYpZGVNlBdRqQ+yaxonmbMwRZYOhT4Nl
         kn31qpgZBTgwMytPfsuXe0ZQu/aB7dvUuoF0Z0zCIF9cl29VCNL0wi6uL+Xi+dyqKlzq
         JqVmBdCcMEcSkbEPl/Pv1BcO/L/vql3ZjjAkibK+1uczjS09cN8tmsyKbgVnDePEM+13
         11Afbq2CCDHXySoFMKEHT4hgvfuvCVWkrrt4coHZ0fZyzF6pB3f2pGU1OScQFz/t7Oep
         FQHQ==
X-Gm-Message-State: AOJu0Yx4lyUogt6rqozJ0tU/qJvrHOWuds5lDYxPPKA+ECjlkOumiPiL
	X58UJbRAa8ZQSLhB8sVcNU4KVuZlkKStmwOVNEU=
X-Google-Smtp-Source: AGHT+IGHYcwYoGOyjglrt55s/xVGXvTLTqzSCQdWweGNUL+PSrnWs0ooJa1EJyRgMNdihnlrs6nEBw==
X-Received: by 2002:a05:620a:8d01:b0:77d:9d7a:4692 with SMTP id rb1-20020a05620a8d0100b0077d9d7a4692mr957093qkn.16.1701872352740;
        Wed, 06 Dec 2023 06:19:12 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id m6-20020a05620a24c600b0077edde498d3sm4202379qkn.89.2023.12.06.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:19:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][RFC] CI: switch back to master
Date: Wed,  6 Dec 2023 09:16:39 -0500
Message-Id: <170187219916.257200.14025060278368926714.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231114122407.185507-1-ross.burton@arm.com>
References: <20231114122407.185507-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:19:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5298


On Tue, 14 Nov 2023 12:24:07 +0000, ross.burton@arm.com wrote:
> Now that we've released 4.3 and branched, we can switch master CI back
> to master.
> 
> 

Applied, thanks!

[1/1] CI: switch back to master
      commit: 310cd898ba0ac469964e03cc13f8d865cf3c299a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

