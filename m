Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15138F31E52
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:57:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131782.1775740229027104673
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k4pmAYnI;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so863702e87.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 06:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775740227; cv=none;
        d=google.com; s=arc-20240605;
        b=kd6kbkOQD/MDuTFNOM6DIXoupwfFgxbos8MkPvDMM3W2cFBeE6svn7G7ZaZJ1PZNI4
         o6HHnqvkzV8vsY/4BPi116A64VtAyYs/br3On/y2I6PUV5z4BYm2UGSGEA66RrULpOd4
         uoOqxu8v7ct1odxJGhYCBTqx2+el8+uXit2mOIxIPT6wKx03bkLvvU3DRco0Ehr/0A+7
         d/CWTyqVnJUX3tWoa9aXhkHsK0cI3TBeOUul2VUP+5JDh1/pKXfWoLVU5hxnUgbJo5//
         jSF2oKrRUzoGzj0yzVupNfbSJ0dXHTe+/SBtqL9hiqrabv6D5tXfJKYnWX7G+SdzAHuV
         8RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U4kKKbP44zQq1euxpo53R1A1chirDcNxxDQfAHogXYA=;
        fh=d0lP92eq70Ag2jXXhCjuBc4Xcs3YNv0mV05nWxAvBEY=;
        b=hdlyOgZKLqytSycZFhOwPNmNpH2+TVVeEEzuSodreEKwo3paw/70zUX0y5LFvF1PVa
         x/DyCPoxmpWm4EJyYIlicGGvk2c+K4ZXvuuAXbvB9jfdz5lDhx78MttY3xe3JuJvLGCE
         Os0+7RqD/A2Us2yeE0YRtIyQyEbtJff6no0GCliI4WmSwe81ADVg3XLfKL725PeD485e
         mdLucB5kgiP2n5JULlaAiktoWeqB/FTvmL0paUahRqsqkQ00jtfUs0oVgbbOGWyjZPng
         pX6h6YxSIeNzxxOiviayxEJVHbShlW7FCFiAn0FiwldeIZiRLDdyDddRV1b+apeagDeB
         O4Qw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775740227; x=1776345027; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4kKKbP44zQq1euxpo53R1A1chirDcNxxDQfAHogXYA=;
        b=k4pmAYnI6VWCFOI7LFqhPXmmtjr52I+r6DimCNnX3CSJK5TrW1JsUxI42feTsQYEJM
         d6MmKscNvm7SZCLJFz3n1yLLoavm/zQGl8zk+rWoLc3PrMZeKZz4kxh+hGLQRmwFibaT
         oTxNY/m9WmMy7hDq0Bq+JwVfsn0CdemuKnZpWSyR1KjugaXJsqVcwl9w34+/SIxX6YfY
         iHUhIdkWltZNthFWtGXOSYx6DgtYtjAHy7tTl0PjILXVoOyJpQHUpuDDB7RBzfNFMwOk
         ElHMZPUZvsqrNXIimhoGzJjI6SlXNa8UKAMLm92HAZN91ZqBpGULqWkBMSfUOqS9OqjK
         vTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740227; x=1776345027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U4kKKbP44zQq1euxpo53R1A1chirDcNxxDQfAHogXYA=;
        b=gfoKPqRXH6rasusqkA9qrZwzidpp9ssOtWp2zJgGj/Jyd4maEcNjYCVfd3+Lfe0tdy
         Z+qRQMEKxlusLTVqNIbhhnESTYPzsVziG0+7oRDK3ztNOGPXPQebynfVk/CaYYuWl3cA
         ywraq40+zYfFEZeRX8B+sKBs29sWfc7SlPQxboaQXM/fTO95ri8fxS+rC7SpGipppBzE
         FxO525kSgka3om75K46HrLse5xyzI42gizdRfcGVmKzIVl5Dsu05TpDGF08OezbAIaYu
         Z4BA23kwRTdKrsg8nQURz1m/VoiDaiCE+iBRRTsBpmg/eYPbJKaUBtWdMPjdWlK8XMBe
         AbwA==
X-Gm-Message-State: AOJu0YxsFRrPFF5ZbMN4qOZTvUJwYLrr2IrFzdjeqoReA3fiRVvyCcrs
	QlNK2O5bwFkgcJjgtG2uAS61uOrWH0bsh4cXy8Wby99AH9dmOoybhLL/tQ6X998HmYdPXnl6oKw
	THnlW/UVfe4dW+QfxVxi7ooE0StNAvC8=
X-Gm-Gg: AeBDietX0cwBWU6DOT8rvIiSB1aoGp3Np3XDCBwg+eokODzx76VOhj+8x2TtglNxy7L
	5YRd+MykhEuJTwHg8ezpSURa46hwFUmh+988jcfFE/RzvSAIxLPIJFOrGZcTo2H9AVXpeMTCdk+
	CP88VvT9qgRD0y01yjJmyhXTv1ptN5g/POFKvDiBFrQwGRAEIflOFrHWq064YmaoRdNEWk+RRSa
	x/7hLWXWN4adPP4iKTCUsqF6mNrX4aDT9/HY5JE7OO85adiAktoNRmVv8IFzRYrJ7f4h/RXEHvB
	RpXa78texQ==
X-Received: by 2002:a05:6512:39c5:b0:5a2:bef4:5dfe with SMTP id
 2adb3069b0e04-5a33754ef48mr7538816e87.9.1775740226771; Thu, 09 Apr 2026
 06:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <adegeIztCtiLd_CA@colin-ia-desktop>
In-Reply-To: <adegeIztCtiLd_CA@colin-ia-desktop>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Apr 2026 15:10:13 +0200
X-Gm-Features: AQROBzBNbv-1MHqulpqyVIyEW3HXM4rcc89IAG7L31b1sPn08aih1ojKRGjulpQ
Message-ID: <CA+chaQdUCdV++-CAayMZyH=e9BLUcjuD9SrKwUfR+idZ4mhYAA@mail.gmail.com>
Subject: Re: [meta-arm] Git repo down?
To: colin.foster@in-advantage.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7010

On Thu, Apr 9, 2026 at 2:50=E2=80=AFPM Colin Foster via lists.yoctoproject.=
org
<colin.foster=3Din-advantage.com@lists.yoctoproject.org> wrote:
>
> Hello,
>
> I'm curious if it is known that the git repos seem to be down. Both of
> the following links seem to fail.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm?h=3Dmast=
er

See
https://git.yoctoproject.org/meta-arm/
and make sure to use https:// protocol to fetch it.

> They were linked here:
>
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/

Yeah, many layers probably need to be updated in layerindex now after
git infra changed a bit recently.

