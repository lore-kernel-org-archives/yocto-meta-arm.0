Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.3053.1591692734213125039
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 01:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aQ1rPS4R;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id t9so10725582ybk.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jun 2020 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWFekGBBdHwBmgB1SIaw7dtvKstriDE17CExqB1v67A=;
        b=aQ1rPS4Re6i/LvSc9LlUveNDcCLy2mGpIA625xyMH0tamdzwSb/eH/weLJEYVN/WYh
         Ih5a+PgWvwkfMy6QNMdCh2vNhcgll+ZLjosdyn12uXEtnNayZ+1hVV9L4KoYf0wezXkH
         iYCq8+XekuamS7FR78dEZ56L3pRQX2N8yuphptdkv0Gp7D7Kv77ECJw62DtqShuixB5y
         acXik62wtI3QcNZ3qtGKiNDFAK8Ins3hg4NrxOlhldGeYZNVI+6ZU2wldgNmO7o/8oMY
         oDwUYK9bldHBGrXQCzG0Pg9T5ErpeS5zg9GvJTHS02gMhwK3xzC+GJOUKyYsgM7n4Gtk
         3ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWFekGBBdHwBmgB1SIaw7dtvKstriDE17CExqB1v67A=;
        b=CibxbnbPKiZn8IQHFhGKHPXOPXScKmOZ3tl4h67NmBCVIq+SP6O3Ajw2GI8hCq3uWS
         Z1CSoqOPAeH6ObHqGNc+W1Su9V6EBoh1qX9fdQnoNTG2J0j8THtJgSyPG68n3vEcycwH
         p0YAv5CVJrzRXJp3G6GcEjGel1WIdXge4NUaqXG5ZY9Np03s09SCW0D+GuMsdrkojGaJ
         dz5tbDbSkgyFYAQjsiv9aX7YMQmXT1diC52raOsgLKRVRIO0UFzwLyumMct8MtFz+HQG
         eGkl3YRFSbSdVW94fAza/bDdQ/V0iNhHMQuqoQSOeHlWCQxaVL1CU59COu5GBK1P/UIb
         Dqkg==
X-Gm-Message-State: AOAM5313du3TWRKe+ON4h4Xu9JdbmFcKdt2IHO/qxyF1RhO2l8WzSDHy
	hWhJNA4kXCMBUtmeVNTHvgwcISU3OjCWZF48ytn/Kw==
X-Google-Smtp-Source: ABdhPJxVZyZPZysbU4NisDIgjqBLIRTLfPgLkM/F4DYqlTe9u7HSLfvzmudkGwmADLEvNLDTG2/vEkS/b3IH7vNOphI=
X-Received: by 2002:a25:5d12:: with SMTP id r18mr4613393ybb.201.1591692733253;
 Tue, 09 Jun 2020 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
In-Reply-To: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 9 Jun 2020 10:52:02 +0200
Message-ID: <CAP71WjxcnNdvXx1BCDLC5nT2zFVrrXYB_9vBKpmWkQ9L0eGPmg@mail.gmail.com>
Subject: Re: [meta-arm] Proposal for the branching policy of meta-arm
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000f51e3705a7a2d7f1"

--000000000000f51e3705a7a2d7f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2020 at 8:38 PM Jon Mason <jon.mason@arm.com> wrote:

> Problem
>
> The Yocto Project releases twice a year (April and October): "stable"
> releases are made every six months and have a lifetime of seven months
> to allow for migration, while "long term support" (LTS) releases are
> picked every two years starting from Dunfell in April 2020. The standard
> practice for all Yocto Compatible layers is to create a "named" branch
> consistent with the code name of that release.   For example, the
> =E2=80=9Cdunfell=E2=80=9D release of Yocto will have a branch named =E2=
=80=9Cdunfell=E2=80=9D in the
> official git repository, and layers compatible with dunfell will have a
> branch named =E2=80=9Cdunfell=E2=80=9D.  Thus, a customer can easily org=
anise a
> collection of appropriate layers to make a product.
>
> In Yocto, these named branches are =E2=80=9Cstable=E2=80=9D, and only ta=
ke bug fixes or
> security-critical upgrades.  Active development occurs on the master
> branch.  However, this methodology can be problematic if mimicked with
> the compatible layers.  Companies or open source projects may not wish
> to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D branches =
under active
> development, due to the amount of testing, fixing, and hardening
> necessary to make a product from a non-stable release.  Also, changes to
> keep the master branch of a layer working with the upstream master
> branch of Yocto may result in that branch no longer being compatible
> with named branches (e.g., it might not be possible to mix and match
> master and dunfell).  So, a decision must be made on the branching
> policy of meta-arm.
>
>
> Proposal
>
> There are many different ways to resolve this issue.  After some
> discussion, the best solution for us is to allow new features and
> hardware enablement to be included in named branches (not just bug
> fixes).  This will allow for a more stable software platform for
> software to be developed, tested, and released.  Also, the single branch
> allows for focused testing (limiting the amount of resources needed for
> CI/CD), lessens/eliminates code diverging on various branches, and
> lessens confusion on which branch to use. The risk of making this choice
> is a potentially non-stable branch which will require more frequent
> testing to lessen the risk, and not following the =E2=80=9Cstable=E2=80=
=9D methodology
> of the core Yocto layers (though it is not uncommon for BSP layers to
> behave as we are recommending).
>

thanks for the clarifications. I believe it makes sense, and I agree that
BSP layers tend to follow a similar process (even though it's not always
documented).


>
> Process
>
> The process for patches intended on being integrated into only the
> master branch is the normal process of pushing to meta-arm mailing list
> for community review, approval and integration into upstream meta-arm
> master branch.  For patches intended on being included in a named branch
> are also the normal internal process of pushing to mailing list for
> community review, approval and integration into meta-arm named branch.
> However, any patches intended on being included on a named branch must
> also be sent for inclusion in the master branch in a timely fashion (no
> more than 1 week after inclusion into the named branch).
>
>
> Branching strategy
>
> Named branches for meta-arm will be released as close as possible to the
> release of the YP LTS release.  Meta-arm named branches will be created
> from the meta-arm master branch.
>

Why only LTS releases? Are you not planning to have named branches for
stable (e.g. non LTS) releases as well?


>
> To minimize the additional work of maintaining multiple branches it is
> assumed that there will only be two active branches at any given time:
> master and the most recent Long Term Stable (LTS) as the named branch.
> All previous named will be EOLed when a new LTS has been released.   Any
> branches that are EOLed will still exist in the meta-arm, but patches
> will not be accepted.
>

I believe users will need a branch for non LTS stable releases as well. It
might not be an 'active' product/development branch for you of course, but
it should exist and be opened to accept community patches at least. With
the new LTS process we now expect 3 types of OE/YP users:
1. active developers on master
2. stable users on current stable, who can switch every 6 month
3. LTS users


>
>
> Branch transitions
>
> When an upcoming YP LTS is approaching release, meta-arm will attempt to
> stabilize master so that the releases can coincide.
>
> T-6 weeks - Email is sent to meta-arm mailing list notifying of upcoming
> code freeze of features to meta-arm
>
> T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at this
> point.
>
> T-0 - All bugs are fixed and layer is stable, new named branch is
> created based on master and no new patches accepted to any previous
> named branches.  Master branch will start accepting patches again.
>
>=20
>

--000000000000f51e3705a7a2d7f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 5, 2020 at 8:38 PM Jon Ma=
son &lt;<a href=3D"mailto:jon.mason@arm.com">jon.mason@arm.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Problem<br>
<br>
The Yocto Project releases twice a year (April and October): &quot;stable&=
quot; <br>
releases are made every six months and have a lifetime of seven months <br=
>
to allow for migration, while &quot;long term support&quot; (LTS) releases=
 are <br>
picked every two years starting from Dunfell in April 2020. The standard <=
br>
practice for all Yocto Compatible layers is to create a &quot;named&quot; =
branch <br>
consistent with the code name of that release.=C2=A0=C2=A0 For example, th=
e <br>
=E2=80=9Cdunfell=E2=80=9D release of Yocto will have a branch named =E2=80=
=
=9Cdunfell=E2=80=9D in the <br>
official git repository, and layers compatible with dunfell will have a <b=
r>
branch named =E2=80=9Cdunfell=E2=80=9D.=C2=A0 Thus, a customer can easily =
organise a <br>
collection of appropriate layers to make a product.<br>
<br>
In Yocto, these named branches are =E2=80=9Cstable=E2=80=9D, and only take=
 bug fixes or <br>
security-critical upgrades.=C2=A0 Active development occurs on the master =
<br>
branch.=C2=A0 However, this methodology can be problematic if mimicked wit=
h <br>
the compatible layers.=C2=A0 Companies or open source projects may not wis=
h <br>
to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D branches un=
der active <br>
development, due to the amount of testing, fixing, and hardening <br>
necessary to make a product from a non-stable release.=C2=A0 Also, changes=
 to <br>
keep the master branch of a layer working with the upstream master <br>
branch of Yocto may result in that branch no longer being compatible <br>
with named branches (e.g., it might not be possible to mix and match <br>
master and dunfell).=C2=A0 So, a decision must be made on the branching <b=
r>
policy of meta-arm.<br>
<br>
<br>
Proposal<br>
<br>
There are many different ways to resolve this issue.=C2=A0 After some <br>
discussion, the best solution for us is to allow new features and <br>
hardware enablement to be included in named branches (not just bug <br>
fixes).=C2=A0 This will allow for a more stable software platform for <br>
software to be developed, tested, and released.=C2=A0 Also, the single bra=
nch <br>
allows for focused testing (limiting the amount of resources needed for <b=
r>
CI/CD), lessens/eliminates code diverging on various branches, and <br>
lessens confusion on which branch to use. The risk of making this choice <=
br>
is a potentially non-stable branch which will require more frequent <br>
testing to lessen the risk, and not following the =E2=80=9Cstable=E2=80=9D=
 methodology <br>
of the core Yocto layers (though it is not uncommon for BSP layers to <br>
behave as we are recommending).<br></blockquote><div><br></div><div>thanks=
 for the clarifications. I believe it makes sense, and I agree that BSP lay=
ers tend to follow a similar process (even though it&#39;s not always docum=
ented).=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
<br>
Process<br>
<br>
The process for patches intended on being integrated into only the <br>
master branch is the normal process of pushing to meta-arm mailing list <b=
r>
for community review, approval and integration into upstream meta-arm <br>
master branch.=C2=A0 For patches intended on being included in a named bra=
nch <br>
are also the normal internal process of pushing to mailing list for <br>
community review, approval and integration into meta-arm named branch.=C2=
=A0 <br>
However, any patches intended on being included on a named branch must <br=
>
also be sent for inclusion in the master branch in a timely fashion (no <b=
r>
more than 1 week after inclusion into the named branch).<br>
<br>
<br>
Branching strategy<br>
<br>
Named branches for meta-arm will be released as close as possible to the <=
br>
release of the YP LTS release.=C2=A0 Meta-arm named branches will be creat=
ed <br>
from the meta-arm master branch.<br></blockquote><div><br></div><div>Why o=
nly LTS releases? Are you not planning to have named branches for stable (e=
.g. non LTS) releases as well?</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
To minimize the additional work of maintaining multiple branches it is <br=
>
assumed that there will only be two active branches at any given time: <br=
>
master and the most recent Long Term Stable (LTS) as the named branch.=C2=
=A0 <br>
All previous named will be EOLed when a new LTS has been released.=C2=A0=
=C2=A0 Any <br>
branches that are EOLed will still exist in the meta-arm, but patches <br>
will not be accepted.<br></blockquote><div><br></div><div>I believe users =
will need a branch for non LTS stable releases as well. It might not be an =
&#39;active&#39; product/development branch for you of course, but it shoul=
d exist and be opened to accept community patches at least. With the new LT=
S process we now expect 3 types of OE/YP users:</div><div>1. active develop=
ers on master</div><div>2. stable users on current stable, who can switch e=
very 6 month</div><div>3. LTS users</div><div>=C2=A0</div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
<br>
Branch transitions<br>
<br>
When an upcoming YP LTS is approaching release, meta-arm will attempt to <=
br>
stabilize master so that the releases can coincide.<br>
<br>
T-6 weeks - Email is sent to meta-arm mailing list notifying of upcoming <=
br>
code freeze of features to meta-arm<br>
<br>
T-4 weeks - Code freeze to meta-arm.=C2=A0 Only bug fixes are taken at thi=
s <br>
point.<br>
<br>
T-0 - All bugs are fixed and layer is stable, new named branch is <br>
created based on master and no new patches accepted to any previous <br>
named branches.=C2=A0 Master branch will start accepting patches again.<br=
>
<br>
<br>
</blockquote></div></div>

--000000000000f51e3705a7a2d7f1--
