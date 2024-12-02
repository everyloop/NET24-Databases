﻿using System;
using System.Collections.Generic;

namespace L005_ScaffoldedMusic.Model;

public partial class Playlist
{
    public int PlaylistId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Track> Tracks { get; set; } = new List<Track>();
}