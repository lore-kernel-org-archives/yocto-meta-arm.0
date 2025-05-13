Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A86BC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:00:12 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.75361.1747141208405425828
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vHBMK5lQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.48, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60634f82c77so1393104eaf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747141207; x=1747746007; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzWwild2LETEufzLQ+e4UT2JGmgxdQNJK/ZRItrdRmo=;
        b=vHBMK5lQkVKWjsvcZcwqqvxW7cty7XWZXWvQacfJ8nxkHtrpOjyihWNSl7gtFO8Dj+
         waeHx63+YP+0KwB0EwcbEaKdWuNrPXNVk450V89xb9HWaEvkhTzFykUdw1McULpCWefY
         Ei91i94lB34hXCXVKXlID9kwnZWYyAWyNtLnAAQ8NwUv4iE4uILyVBt1tuWNtLZQ9l7o
         M3y52jVxiNkgDyD18uQZ2qJSpXXK6o8G6647bHXlDmgMWCNQV4H2zD+6MlP2FXUDnyvK
         bh8XOyCl2I04ufBJ1Ig/D5iQKNXK6yVqPfGBef/DLw3MAylJOnSKpVmpzsWECEkIIEqS
         VgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141207; x=1747746007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzWwild2LETEufzLQ+e4UT2JGmgxdQNJK/ZRItrdRmo=;
        b=oE5pGVZZNOhF4pmNby40gWPFY4XvEWTdifSGCwK3Dus+xcB5L9cAywUUgAuLH7QJZc
         IwMlXaWW3KOYIbYuYeO3rgXma9Kfq61UKh/7bflMXbZJw6QxlgSptH8vS7/wN6f5jHfl
         UyeiSiU4RvSuQLZkRoOhZnXNDHjVX7wcvq5Vi7Y8V9r0ITl5zB/KiaW8uagawiWZCdiw
         8h7zXucUuz8PgGDCFp6ZXHHk2GFeaNk8gcSuecFzXzDtMzvFZNx4iMUTIs7AiFAbFQmu
         39aRHcbhzhGpn1ZHTpVKe6QLHSHdlKGkV082OkDS8jDtrmvbH1XLjxeIWcN9hLAJsyXW
         ClEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIzu+jbDeFOeP6gdgMkDICPi4gtsbYfwqbXiQB+r0lHCx5U4lpPz5gzzWT83hSzLDBvaoMoL2HuQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxrTNnEkMFqYI1ptcTK9OAFboJxrnmOV/CV9eovCkFY32KJ9NgC
	UV9dNr2J5wghmgwkzET7BYd/kPNtPkAzykoGftman3U17qFTfdTCaq7eYuGBuXStBpUEtN4pW54
	2kzO6cxDN6Zp87ttD11bx9okZbFWo3xONtBOe
X-Gm-Gg: ASbGncvwTiioIoplc6tLNa7hrILHz/Vcim+43cWDlYwHE0B6LdPh1hqDTy+bElWF2b5
	UaUOSVKo5r7EZ1tNgzyx12SLdi022QJbyAEJEY51zUnblPWQdhM2SlIuCbzwZXjDDIp3LRT/cXD
	uw9oNAhl9RT3Bx6thIX/N0AyNRXVbCcJ6m
X-Google-Smtp-Source: AGHT+IGpDAAQS1TkE9PWWtukAbsT67z3MWKDT+upcFul8kRRmOG834y0Fj9XoUdzlXeC6/cziZrL6wKzkg8KwmGsa9A=
X-Received: by 2002:a05:6808:2110:b0:403:31b5:7eb1 with SMTP id
 5614622812f47-403800ec049mr9074208b6e.36.1747141207419; Tue, 13 May 2025
 06:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250506165045.509-1-ali.oezaslan@arm.com> <20250506165045.509-2-ali.oezaslan@arm.com>
 <F73BDBCD-10C3-4B0A-A867-FCD7DC7BCF7F@arm.com>
In-Reply-To: <F73BDBCD-10C3-4B0A-A867-FCD7DC7BCF7F@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 13 May 2025 08:59:56 -0400
X-Gm-Features: AX0GCFt4THnEPzP57W5Z3TpB6MJhmSy-8eD330A7uhPnDBihhVtgvuPCaBeNdLM
Message-ID: <CAPoiz9zBSn4QrBMQj2F9eughYYqpuWSO-_zoCLMpWv19yaSxng@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
To: ross.burton@arm.com
Cc: Ali Ozaslan <Ali.Oezaslan@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 13:00:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6498

I applied the walnascar one to master (and am currently merging both).
The Pending thing is an issue that needs to be addressed, but we can
do that after (given the proximity of the release)

On Mon, May 12, 2025 at 1:23=E2=80=AFPM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:
>
> On 6 May 2025, at 17:50, ali.oezaslan via lists.yoctoproject.org <ali.oez=
aslan=3Darm.com@lists.yoctoproject.org> wrote:
> >
> > From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> >
> > The psa_client_key_attributes_s struct had to be aligned with the
> > psa_key_attributes_s struct in TF-M.
> >
> > Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
> > ---
> > components/service/crypto/include/psa/crypto_client_struct.h | 1 -
>
> I=E2=80=99m guessing that you=E2=80=99re doing git-format-patch and then =
git-send-email manually, because the cover letter is correct but this is a =
patch for TF-M, not meta-arm.
>
> Can you re-send?
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6497): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6497
> Mute This Topic: https://lists.yoctoproject.org/mt/112652834/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

