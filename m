Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6401.1623237742847427894
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 04:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=IBCc1H/I;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so3547079wmq.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Jun 2021 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=juItY9+VrJ/ScuLiRhCGyM6i1M8B64Rkm3E+2j4OJpE=;
        b=IBCc1H/IFvwKBVwGurBdR8OUyqHFlfPCLrlqC+tF2BHKebVyZmDlAxA2b0iuL3EXJS
         KWnziXYf0OInK63GQhZtThSa5bKAu8EcaN0UIFoRNSExAuzTe3TlJxYn5xqj1qQF/Jti
         b8Ih+osDPxqrIlMuXZF7JattJkAZQ6IHt6gLNuzATiCE7t1IvUoQhnjAt2AbnKJQrRFT
         PoFr/YEkSCnkx73jm7ArNtKZLmLhgqSMauldirQdwrCzfMdtv6xUmys7+EQSQFaXJ0Xi
         C9m+zYVxZXTpM0gqfWwGaXaTTzqaj0kYqo7B6WbYCl7dDdZi3SCUUNdZKuBKja0eKq4/
         Kz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=juItY9+VrJ/ScuLiRhCGyM6i1M8B64Rkm3E+2j4OJpE=;
        b=iWVVWVUEMVOxIdEWtGFCDW3zEAO4uanz5o/VRudnG6riu0XbjVZQP6ta2Ljz8xX7Uf
         5bDIT6c3mqVAVfqULY0uTKYI0zOorHsLOZKSjgoHgHcvBaXmeQVbNSAMmIBemRjcGX+L
         DoFVJLCywsIHxY2dQuuGqgINENP+gAEfPGfTZNMJDaHrmOO13sAwyyUOXFcz9bX9KieQ
         7zFp/N78t/x5jt+Ck0VhnDrc4hEPyNOZGIaDUMBp5zZ8LntqSh1LieWE06OIy0wd2I3V
         SGqlfN1vaO/qrP9TRRD5Lxo0ZAtUHO5J5q+LUIpoo2CG78HpbIvraMeiQkD9zQLHuqlo
         l5Fg==
X-Gm-Message-State: AOAM533IcXzQK+XIsy6/OnEtMsp9ZtAi1VrStWWCL4dyHKhTk0WflaEm
	m3DYCJBQWxxAu0Bud/+W8PXQcLUCIhE/wZQ5jfgQlQ==
X-Google-Smtp-Source: ABdhPJxUdp7Cx6PG4BY3lBt32TpdDOSIhT171iOaKM2fKNrCWZGyJNYue53yI+94vpn7RIi1RyoVruiMfWHkFontT3Q=
X-Received: by 2002:a1c:df85:: with SMTP id w127mr9452987wmg.130.1623237741376;
 Wed, 09 Jun 2021 04:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210501185313.606401-1-peron.clem@gmail.com> <CAAnfSTvyRQEL5Qjt40tgoMouDeerzzQYE7jvBhtnJoSfVdsruw@mail.gmail.com>
 <CAAnfSTsw5pBRgRZqC2efh61AdRDYKYby2apAS9vxOjYLH-67mw@mail.gmail.com> <CAJiuCcdcfTy9sK77mpotaEV_9uk45-FT7rdsREQWa417xxmhDQ@mail.gmail.com>
In-Reply-To: <CAJiuCcdcfTy9sK77mpotaEV_9uk45-FT7rdsREQWa417xxmhDQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 9 Jun 2021 12:22:10 +0100
Message-ID: <CAAnfSTtY472ZnzZ6DgybrRD7nCp+MKhSM1p3ZySbEnghv1H+HQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Jun 2021 at 09:18, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 wrote:
> I don't plan for the moment to add the rest of the tools but maybe someon=
e will.
> For the package name up to you, what do you prefer?

Maybe use gator-daemon so that if the rest of the suite is built in
the future we don't need to rename anything.

Ross
