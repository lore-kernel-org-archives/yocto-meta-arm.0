Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD17DCE8368
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:25:12 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.59002.1727713508886863260
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 09:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VObqLZ0w;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbc5db8a31so35056447b3.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727713508; x=1728318308; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFb1WsnoH2iW8J0lFeAj3PDK7R+br85oMJM0sfzZQRQ=;
        b=VObqLZ0wgvemfRu+NQ6k/D80jjHpgrXTzgwdG0aQ+ELZLUaID10wuWyv5LH5P9HO66
         Q0j1XjSnBOBrLn5hXLQIRn+6CHfRlMTeumgHlPTYoam1VfkJeliil85ucN44dPhzy7K1
         yoKU4K0UgUvTtzT15zKLNwe4lq37FH1da4J9DEQE3nXwRT/ATMDul9xfAxXDteFPhYko
         Vha6lLJctjD0sTGLZ0LNwtGWNSM2HANeX5XiQKfI6Vwkrz1eqkVFPOQ2XIWiS2VIPaG7
         1iUiMjo72OljSyaiHGcK8dm1K922QknsLhSKENUwWWMjYGrlTgqhiVstKFibUdwvLJkR
         sAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713508; x=1728318308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFb1WsnoH2iW8J0lFeAj3PDK7R+br85oMJM0sfzZQRQ=;
        b=SKt1AGZ/r5fRE1+UfAvtPJEuZM8EDPjxK7wLFISzyqxHHF7o9b+PFhR/HMRo7q8684
         kxB45YQaSJqd+Jn/oJHO0qTwywOqWFmjqz4AKaZadO0Q6Ku2l4di/eN5BQPX8ZpzxbGM
         tuhzfdS6TxYFyu9HWYJMTNHzorbm0OZL8Uu+YDFgZlOWxviOIthrgpqyqKyJQD3aWN27
         zGr4sS30Vt989GN+sfgUaiBiEMUmkPJVe0yEvGmCryIHlxDcRhxbJydZfSk1pmfKWWQ+
         8fAh+v9vpDoj44HqAfheWBI34tImNEJuI3LkoIiMANCBztBTIV2TK/ik2lig373Ohdgx
         2t+A==
X-Gm-Message-State: AOJu0Yxbg8bbvmANGpiVyapkZxSqTyTAVbfOlhfjo5iTWd0PPG9VzG7w
	z47YvYNBoN3MvWiymxbmpIPBQTRoUZGW+9g5MD5UX2/xwwh1uZFX3Cv1poHXhgtaHBac2RMRooA
	=
X-Google-Smtp-Source: AGHT+IEs0IUc1hoeC5pZgjzh5grvRkxJ61F2JHpIVc3l9cQbjAajK+8RL56XE0/1aEfW0p89vBp0HA==
X-Received: by 2002:a05:690c:7246:b0:6db:d221:b739 with SMTP id 00721157ae682-6e290dca9e1mr1802587b3.10.1727713507922;
        Mon, 30 Sep 2024 09:25:07 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24538aff0sm14395287b3.126.2024.09.30.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:25:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: use trusted-firmware-a v2.11
Date: Mon, 30 Sep 2024 12:24:35 -0400
Message-Id: <172771348143.724488.17636566057505510535.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927174426.80998-1-jon.mason@arm.com>
References: <20240927174426.80998-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Sep 2024 16:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6144


On Fri, 27 Sep 2024 13:44:26 -0400, Jon Mason wrote:
> Update to use the latest version of tf-a.  The patch for virtio was
> upstreamed and already in v2.11.
> 
> 

Applied, thanks!

[1/1] arm-bsp/fvp-base: use trusted-firmware-a v2.11
      commit: eefb6a12ba66ff47fd6a146cf8a9f03c52a7793c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

