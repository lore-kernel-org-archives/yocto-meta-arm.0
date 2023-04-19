Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA215C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 12:47:39 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.36608.1681908452538634684
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 05:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ydrhyd4J;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: peron.clem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id fv6so19423094qtb.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681908451; x=1684500451;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dcGfcd8rQuMl4OpFUoZiz4l6BkNYBHziW/GmnsXFcMU=;
        b=Ydrhyd4JmID4h/iDpXtCtCjaCPNVL71mDGzZoCo536/5NLYCDBqpfRVa8hf0qFcWLj
         5v+IAQka22uI833Ibn4oQNAqjEboyF3jtIudnNgoQKbuoZC2Cw9m4yT1uF6fRdDKoWeU
         Z08svPqA1tye+wiezW8k1hVR0Qs5AL+w2jkXBTeUr7CHkA1h6+UB1rHzfyod8OsYk2p3
         QuO8HiizdQY8L1O+mHKUjkkF+k0qVawwjzQoKRpm8YE6yQSoEkwBkYnUosDf5VqquIR3
         QfFiBQA5lTqTLvySdoJSyHjulptKN66TSgsNQEAdKNX1I5e4Sh3a6scYpAMYxC1WQsHr
         pW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681908451; x=1684500451;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcGfcd8rQuMl4OpFUoZiz4l6BkNYBHziW/GmnsXFcMU=;
        b=ifKOBqyUkFj617wTAIsfLCtJ1E+jG3qs2Q97F7FTVhOW+GsAtnfyDQK0wZlr/ALSoT
         XDbSJJ9czgAbLeWC6EUUf3RT/s6Q/XHZ/E+U2xEYC3kPqmT6fMVb2hoSPxQ9j8HXS+s9
         V3G1w0HO0UfdrgGWnLfBgcJirJjDcKcubmNNeQC4wf7bHMBO0g3SmgCXst4rVmXk7uVV
         DWCq0p1L6nwT43nduQEvJBOhgn/klaQQYKZwaNmyrZel2Xv0upIdhAzFhbDtR8QozmQP
         nq4sG+sevFCVHtHkWaXwTJobzQFnmMz8y58P6meRFBmoMiard4FL2+uxvYPT7QQ8+LLh
         901Q==
X-Gm-Message-State: AAQBX9dYRerZECa81ZhxT5/tldKt7EtNh1DskmOUs3VwVnYBuh9xOQvs
	n3ddJdPoSf9EjhNiBy3fJiIm2bUfpqOI21a60tqPJR/B
X-Google-Smtp-Source: AKy350ZxM3M9HFt8a0MBNuRVFapOW80tF2YPrefDA0/V/4wKApJShBGNdsIdzqcknqXtjhi7ZxRORmfB3rkkAkEf2Ek=
X-Received: by 2002:ac8:5901:0:b0:3e3:7fda:2ba1 with SMTP id
 1-20020ac85901000000b003e37fda2ba1mr5983556qty.52.1681908451201; Wed, 19 Apr
 2023 05:47:31 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 19 Apr 2023 14:47:20 +0200
Message-ID: <CAJiuCceSV9ew8zgq+WaY4vRa4OmzqqOGQDnQbEBT2mZoG-QSug@mail.gmail.com>
Subject: FVPConf leak host path with absolute links
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 12:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4581

Hi,

I've two separate machines.
One is a builder that generates my Yocto firmware and I'm now
integrating a FVP machine.
One is a "tester" that runs and validates my firmwares.

The Problem is that they don't share the same folder hierarchy and the
fvpconf is not really usable as it's full of absolute paths.

Is there a strong reason to use absolute paths in the fvpconf?

Would it be acceptable to move to relative ones instead?

Thanks for your help,
Clement

