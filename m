Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.4570.1593165957114824835
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 03:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yMdOT2DQ;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id i3so9725424ljg.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jun 2020 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKjZ7otaVAtlTzVJGGhPl6DBmdf89WYrcq+9uo7hh1E=;
        b=yMdOT2DQtXY9/ic3klCPExMRa0J2WUsONTEPdMVwFBjymC40t+FlzCSM0oQqPsPHoI
         YWVQcJ41pjIw6Ao9CDy5OjhIMvFK5JxZQ4JkrXkyzfk3NyNO9//ppBp0bLsgOxYkVKvz
         227VkT3xgjjfJYZGuw6I8FMXGTSMv5dE3KsWxoJxhj+2aycx6wu/0LkK5XJK9UDsecvb
         78B+E4bUk2xBEh4xCKQJOhrx0ZpUvpDKxRwunI0Lek6ifNNdfA+TED+4dM08PnhJ+HDg
         TxigPEyGzYLXB9HgedU/s39/Tio1BaOIHnAeZ+bwXoypVbd28qfpACpjjV5kOkb/z0G+
         r/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKjZ7otaVAtlTzVJGGhPl6DBmdf89WYrcq+9uo7hh1E=;
        b=rUygRUwZ/sjaIS1vlfTI0ulgOJi7/K2AI40z+tVS4M3y662SvoT9yBeZbCEr8eTzUh
         yJHCLIfqdVt8apuPzfIIbKBnUKm5/Ul9tZSMj1+6owci1CqDtfD+ziFq2Dzyxngzy6mq
         7i0BrQORZl2CicUNCBepWjOVYGJTjZEoOqbcNt8vqf7PE5ZYx/pvNBBfmS2ZZAAi+vR0
         MJ0VJIn/MOBYwanlKXuaWIIep2acLR16F2Bb5Ej/3/ZmtbjhjG5vYtkPwmZ4Z6uktxxr
         km6pXV5MuxabwvtNWGnl/zblIZjOmT+lk7YaP/r//7/dSVDt7+X+ldLSZyPSnml9BoRQ
         9imw==
X-Gm-Message-State: AOAM531xwVbfYwT9B9tcnu7GM8P0yrdgvq1sSku3Uk0pWipNlRwJ0+EV
	zecj231UAEosw9c3AN3c+ITP466z9LbmWXG2pYJHKA==
X-Google-Smtp-Source: ABdhPJwZQJq2pj9Mg+Vr+JiJ7KE/6UBV03e/4zTPELflYlYwKACeaM+o9Qj9niFwuiRv1xKoyToVWY//qCoOEveufUg=
X-Received: by 2002:a05:651c:2cc:: with SMTP id f12mr996411ljo.329.1593165955124;
 Fri, 26 Jun 2020 03:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200622071401.2570-1-gabor.abonyi@arm.com> <20200622071401.2570-3-gabor.abonyi@arm.com>
 <CAAnfSTvpWeYMN-X8csZLBqsgHtZbu0XTvuG7QTdW-44BPoGeMg@mail.gmail.com> <VI1PR0802MB2414F98E1E5A0DAB62E798BC8E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR0802MB2414F98E1E5A0DAB62E798BC8E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 26 Jun 2020 11:05:44 +0100
Message-ID: <CAAnfSTu0WfHDSmEsGwvmmFLHiRk=TfkW7PwqTipjbrscsLu29Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/6] arm-toolchain: armcompiler: Add Arm Clang recipe
To: Gabor Abonyi <Gabor.Abonyi@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2020 at 08:47, Gabor Abonyi <Gabor.Abonyi@arm.com> wrote:
> It is required for certain optimizations. Usually Arm Clang results in smaller code size, which can be key to M-class.
> Usually someone dealing with TF-M on a more serious level, uses Arm Clang at some point of the development.

Looks like I really need to actually finish the truly flexible
toolchain support so the user can just switch the platform or some
specific recipes to different compilers with just a variable
assignment.

Ross
